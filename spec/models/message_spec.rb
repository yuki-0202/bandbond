require 'rails_helper'

RSpec.describe Message, type: :model do

  user = FactoryBot.create(:user)
  let(:message) { FactoryBot.create(:message) }

  describe 'チャット投稿' do
    context 'チャットが投稿できる場合' do
      it 'contentが存在していれば投稿できる' do
        expect(message).to be_valid
      end
    end
    context 'チャットが投稿できない場合' do
      it 'contentが空では保存できない' do
        message.content = ''
        message.valid?
        expect(message.errors.full_messages).to include('メッセージを入力してください')
      end
      it 'roomが紐付いていないと保存できない' do
        message.room_id = nil
        expect(message).to be_invalid
      end
      it 'userが紐付いていないと保存できない' do
        message.user_id = nil
        expect(message).to be_invalid
      end
    end
  end
end
