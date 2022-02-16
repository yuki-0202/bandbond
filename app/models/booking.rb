class Booking < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre
  belongs_to :area

  with_options presence: true do
    validates :area_id
    validates :genre_id
    validates :venue
    validates :detail
    validates :date_start
    validates :date_end
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
    validates :area_id
  end

  validate :date_valid

  private

  def date_valid
    errors.add(:date_start, '未来の日付を入力してください') if date_start < Date.today
    errors.add(:date_end, '未来の日付を入力してください') if date_end < Date.today
    errors.add(:date_end, '開催期間（開始）より過去の日付は入力できません') if date_start > date_end
  end
end
