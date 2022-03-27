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
end
