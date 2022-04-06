require 'rails_helper'

RSpec.describe 'ブッキング管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @booking = FactoryBot.build(:booking, user_id: @user.id)
  end

  context 'ブッキング投稿テスト' do
    it 'ブッキング投稿に成功し、トップページへ遷移する' do
      sign_in(@user)
      find('#navbar_booking').click
      expect(page).to have_content('新規投稿')
      click_on('新規投稿')
      expect(current_path).to eq(new_booking_path)
      select @booking.area.name, from: 'booking[area_id]'
      select @booking.genre.name, from: 'booking[genre_id]'
      fill_in 'booking[date_start]', with: @booking.date_start
      fill_in 'booking[date_end]', with: @booking.date_end
      fill_in 'booking[venue]', with: @booking.venue
      fill_in 'booking[detail]', with: @booking.detail
      expect { click_on('投稿する') }.to change { Booking.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content(@booking.area.name && @booking.venue && @booking.date_start)
    end

    it 'ブッキング投稿に失敗し、再びブッキング投稿ページへ戻ってくる' do
      sign_in(@user)
      find('#navbar_booking').click
      expect(page).to have_content('新規投稿')
      click_on('新規投稿')
      expect(current_path).to eq(new_booking_path)
      select '---', from: 'booking[area_id]'
      select '---', from: 'booking[genre_id]'
      fill_in 'booking[date_start]', with: ''
      fill_in 'booking[date_end]', with: ''
      fill_in 'booking[venue]', with: ''
      fill_in 'booking[detail]', with: ''
      expect { click_on('投稿する') }.to change { Booking.count }.by(0)
      expect(current_path).to eq(bookings_path)
      expect(page).to have_content('地域を入力してください')
    end
  end

  context 'ブッキング編集テスト' do
    it 'ブッキング編集に成功し、ブッキング詳細ページへ遷移する' do
      @booking.save
      sign_in(@user)
      visit booking_path(@booking.id)
      click_on('編集')
      expect(current_path).to eq(edit_booking_path(@booking.id))
      fill_in 'booking[venue]', with: '日本武道館'
      expect { click_on('変更する') }.to change { Booking.count }.by(0)
      expect(current_path).to eq(booking_path(@booking.id))
      expect(page).to have_content('日本武道館')
    end

    it 'ブッキング編集に失敗し、再びブッキング編集ページへ戻ってくる' do
      @booking.save
      sign_in(@user)
      visit booking_path(@booking.id)
      click_on('編集')
      expect(current_path).to eq(edit_booking_path(@booking.id))
      fill_in 'booking[venue]', with: ''
      expect { click_on('変更する') }.to change { Booking.count }.by(0)
      expect(current_path).to eq(booking_path(@booking.id))
      expect(page).to have_content('会場を入力してください')
    end
  end

  context 'ブッキング削除テスト' do
    it 'ブッキングの削除に成功し、トップページへ遷移する' do
      @booking.save
      sign_in(@user)
      visit booking_path(@booking.id)
      click_on('削除')
      expect { click_on('削除する') }.to change { Booking.count }.by(-1)
      expect(current_path).to eq(root_path)
      expect(page).to have_no_content(@booking.venue)
    end
  end

  context '投稿履歴テスト' do
    it '投稿したブッキングが投稿履歴に表示される' do
      # ブッキング投稿
      sign_in(@user)
      find('#navbar_booking').click
      expect(page).to have_content('新規投稿')
      click_on('新規投稿')
      expect(current_path).to eq(new_booking_path)
      select @booking.area.name, from: 'booking[area_id]'
      select @booking.genre.name, from: 'booking[genre_id]'
      fill_in 'booking[date_start]', with: @booking.date_start
      fill_in 'booking[date_end]', with: @booking.date_end
      fill_in 'booking[venue]', with: @booking.venue
      fill_in 'booking[detail]', with: @booking.detail
      expect { click_on('投稿する') }.to change { Booking.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content(@booking.area.name && @booking.venue && @booking.date_start)

      # 投稿一覧の表示されていないページへ遷移
      find('#navbar_booking').click
      expect(page).to have_content('投稿履歴')
      click_on('新規投稿')
      expect(current_path).to eq(new_booking_path)

      # ヘッダーから投稿履歴に表示されているかを確認
      find('#navbar_booking').click
      expect(page).to have_content('投稿履歴')
      find('#booking_history').click
      expect(page).to have_content(@booking.area.name && @booking.venue && @booking.date_start)
    end
  end
end
