require 'rails_helper'

RSpec.describe RoomUser, type: :model do
  let(:room_user) { FactoryBot.create(:room_user) }

  describe '中間テーブル作成' do
    context '保存できる場合' do
      it 'roomとuserが紐づいていれば保存できる' do
        expect(room_user).to be_valid
      end
    end

    context '保存できない場合' do
      it 'roomが紐づいていないと保存できない' do
        room_user.room_id = nil
        expect(room_user).to be_invalid
      end
      it 'userが紐づいていないと保存できない' do
        room_user.user_id = nil
        expect(room_user).to be_invalid
      end
    end
  end
end
