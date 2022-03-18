require 'rails_helper'

RSpec.describe Booking, type: :model do
  before do
    @booking = FactoryBot.build(:booking)
  end

  describe 'ブッキング投稿' do
    context 'ブッキング投稿ができる場合' do
      it '全ての項目が正しく入力されていれば投稿できる' do
        expect(@booking).to be_valid
      end
    end

    context 'ブッキング投稿ができない場合' do
      it '地域の情報がないと投稿できない' do
        @booking.area_id = '1'
        @booking.valid?
        expect(@booking.errors.full_messages).to include("地域を入力してください")
      end
      it 'ジャンルの情報がないと投稿できない' do
        @booking.genre_id = '1'
        @booking.valid?
        expect(@booking.errors.full_messages).to include("ジャンルを入力してください")
      end
      it '開催期間（開始）が空では投稿できない' do
        @booking.date_start = nil
        @booking.valid?
        expect(@booking.errors.full_messages).to include("開催期間（開始）を入力してください")
      end
      it '開催期間（開始）が現在より過去の日付では投稿できない' do
        @booking.date_start = Date.yesterday
        @booking.valid?
        expect(@booking.errors.full_messages).to include("開催期間（開始）を過去の日付にすることはできません")
      end
      it '開催期間（終了）が空では投稿できない' do
        @booking.date_end = nil
        @booking.valid?
        expect(@booking.errors.full_messages).to include("開催期間（終了）を入力してください")
      end
      it '開催期間（終了）が現在より過去の日付では投稿できない' do
        @booking.date_end = Date.yesterday
        @booking.valid?
        expect(@booking.errors.full_messages).to include("開催期間（終了）を過去の日付にすることはできません")
      end
      it '開催期間（終了）が開催期間（開始）より過去の日付では投稿できない' do
        @booking.date_start = Date.tomorrow
        @booking.date_end = Date.today
        @booking.valid?
        expect(@booking.errors.full_messages).to include("開催期間（終了）を開催期間（開始）より過去の日付にすることはできません")
      end
      it '会場が空では投稿できない' do
        @booking.venue = ''
        @booking.valid?
        expect(@booking.errors.full_messages).to include("会場を入力してください")
      end
      it '詳細が空では投稿できない' do
        @booking.detail = ''
        @booking.valid?
        expect(@booking.errors.full_messages).to include("詳細を入力してください")
      end
    end
  end
end
