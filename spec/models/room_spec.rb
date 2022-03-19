require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it 'roomとuserが紐づいていれば保存できる' do
        expect(@room).to be_valid
      end
    end

    # context '新規作成できない場合' do
    #   it 'roomが紐づいていないと保存できない' do
    #     @room.booking_id = nil
    #     @room.valid?
    #     expect(@room.errors.full_messages).to include('Room must exist')
    #   end
    #   it 'userが紐づいていないと保存できない' do
    #     @room.user_id = nil
    #     @room.valid?
    #     expect(@room.errors.full_messages).to include('User must exist')
    #   end
    # end
  end
end
