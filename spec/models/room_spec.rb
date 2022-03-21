require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { FactoryBot.create(:room) }

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it 'bookingとuser_idが存在していれば保存できる' do
        expect(room).to be_valid
      end
    end

    context '新規作成できない場合' do
      it 'bookingが紐づいていないと保存できない' do
        room.booking_id = nil
        expect(room).to be_invalid
      end
      it 'user_idが空だと保存できない' do
        room.user_id = nil
        expect(room).to be_invalid
      end
    end
  end
end
