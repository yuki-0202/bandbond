require 'rails_helper'

RSpec.describe 'ルーム管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @booking = FactoryBot.create(:booking)
    @room = FactoryBot.build(:room, booking_id: @booking.id, user_id: @user.id)
  end

  context 'ルーム自動作成テスト' do
    it 'ルーム自動作成に成功し、ルーム詳細ページへ遷移する' do
      sign_in(@user)
      visit booking_path(@booking.id)
      expect { click_on('チャットルーム') }.to change { Room.count }.by(1)
      expect(current_path).to eq(room_path(Room.last.id))
    end

    it 'すでにルームが存在する場合、ルーム自動作成は実行されず、該当のルーム詳細ページへ遷移する' do
      @room.save
      sign_in(@user)
      visit booking_path(@booking.id)
      expect { click_on('チャットルーム') }.to change { Room.count }.by(0)
      expect(current_path).to eq(room_path(@room.id))
    end
  end

  context 'ルーム自動削除テスト' do
    it 'ルーム自動削除に成功し、ブッキング詳細ページへ遷移する' do
      @room.save
      sign_in(@user)
      visit booking_path(@booking.id)
      expect { click_on('チャットルーム') }.to change { Room.count }.by(0)
      expect(current_path).to eq(room_path(@room.id))
      expect { click_on('もどる') }.to change { Room.count }.by(-1)
      expect(current_path).to eq(booking_path(@booking.id))
    end

    it 'ルーム内にチャットが存在する場合、ルーム自動削除は実行されず、ブッキング詳細ページへ遷移する' do
      sign_in(@user)
      visit booking_path(@booking.id)
      click_on('チャットルーム')
      expect(current_path).to eq(room_path(@booking.rooms.ids))
      fill_in 'message[content]', with: 'ルーム削除テスト'
      expect { click_on('送信') }.to change { Message.count }.by(1)
      expect(current_path).to eq(room_path(@booking.rooms.ids))
      expect(page).to have_content('ルーム削除テスト')
      expect { click_on('もどる') }.to change { Room.count }.by(0)
      expect(current_path).to eq(booking_path(@booking.id))
    end
  end
end
