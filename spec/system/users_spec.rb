require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ログインテスト' do
    it 'ログインに成功し、トップページに遷移する' do
      @user.save
      # basic_pass → 「spec/support/sign_in_support.rb」にメソッド定義
      basic_pass new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_on('Log in')
      expect(current_path).to eq(root_path)
    end

    it 'ログインに失敗し、再びサインインページに戻ってくる' do
      @user.save
      visit new_user_session_path
      fill_in 'user[email]', with: 'test'
      fill_in 'user[password]', with: 'test'
      click_on('Log in')
      expect(current_path).to eq(new_user_session_path)
    end

    it 'ログイン状態でサインインページへ遷移しようとすると、トップページへ戻される' do
      @user.save
      sign_in(@user)
      visit new_user_session_path
      expect(current_path).to eq(root_path)
    end
  end

  context '新規登録テスト' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      expect { click_on('Sign up') }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end

    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit new_user_registration_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'user[nickname]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      expect { click_on('Sign up') }.to change { User.count }.by(0)
      expect(current_path).to eq(user_registration_path)
    end
  end

  context 'ユーザー編集機能' do
    it 'ユーザー編集に成功し、トップページへ遷移する' do
      @user.save
      sign_in(@user)
      visit root_path
      find('.user-nickname').click
      click_on('編集する')
      expect(current_path).to eq(edit_user_path(@user.id))
      fill_in 'user[nickname]', with: 'テスト'
      expect { click_on('更新する') }.to change { User.count }.by(0)
      expect(current_path).to eq(root_path)
      expect(find('.user-nickname')).to have_content('テスト')
    end

    it 'ユーザー編集に失敗し、再び編集ページへ戻ってくる' do
      @user.save
      sign_in(@user)
      visit root_path
      find('.user-nickname').click
      click_on('編集する')
      expect(current_path).to eq(edit_user_path(@user.id))
      fill_in 'user[nickname]', with: ''
      expect { click_on('更新する') }.to change { User.count }.by(0)
      expect(current_path).to eq(user_path(@user.id))
      expect(page).to have_content('ニックネームを入力してください')
    end

    it '画像投稿に成功し、トップページへ遷移する' do
      @user.image = nil
      @user.save
      sign_in(@user)
      visit root_path
      find('.user-nickname').click
      click_on('編集する')
      expect(current_path).to eq(edit_user_path(@user.id))
      image_path = Rails.root.join('public/images/test_neko.webp')
      attach_file('user[image]', image_path, make_visible: true)
      expect { click_on('更新する') }.to change { User.count }.by(0)
      expect(current_path).to eq(root_path)
      find('.user-nickname').click
      expect(page).to have_selector("img[src$='test_neko.webp']")
    end

    it '画像削除に成功し、編集ページへ戻ってくる' do
      @user.save
      sign_in(@user)
      visit root_path
      find('.user-nickname').click
      click_on('編集する')
      expect(current_path).to eq(edit_user_path(@user.id))
      expect(page).to have_selector("img[src$='test_neko.webp']")
      click_on('削除')
      click_on('削除する')
      expect(current_path).to eq(purge_users_path)
      expect(page).to have_no_selector("img[src$='test_neko.webp']")
    end

    it '自身の投稿したブッキング詳細の投稿者名から、ユーザー編集ページへ遷移できる' do
      @booking = FactoryBot.create(:booking)
      sign_in(@booking.user)
      visit root_path
      visit booking_path(@booking.id)
      find('#booking_user_nickname').click
      click_on('編集する')
      expect(current_path).to eq(edit_user_path(@booking.user.id))
    end

    it '自身の投稿したブッキングのチャットルームのオフキャンバスから、ユーザー編集ページへ遷移できる' do
      @room_user = FactoryBot.create(:room_user)
      @message = FactoryBot.create(:message, room_id: @room_user.room_id)
      sign_in(@room_user.room.booking.user)
      visit root_path
      visit booking_path(@room_user.room.booking.id)
      click_on('チャットルーム一覧')
      find('#room_list').click
      click_on('ブッキング詳細を表示')
      find('#booking_user_nickname').click
      click_on('編集する')
      expect(current_path).to eq(edit_user_path(@room_user.room.booking.user.id))
    end
  end
end
