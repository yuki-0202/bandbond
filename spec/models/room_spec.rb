require 'rails_helper'

RSpec.describe Room, type: :model do
    user = FactoryBot.create(:user)
    let(:room) { FactoryBot.create(:room) }

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it 'bookingとuserが紐づいていれば保存できる' do
        expect(room).to be_valid
      end
    end

    context '新規作成できない場合' do
      it 'bookingが紐づいていないと保存できない' do
        room.booking_id = nil
        expect(room).to be_invalid
      end
      it 'userが紐づいていないと保存できない' do
        # room.user_id = nil
        # expect(room).to be_invalid
      end
    end
  end
end
