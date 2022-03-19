class Booking < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre
  belongs_to :area
  has_many :rooms, dependent: :destroy

  with_options presence: true do
    validates :area_id
    validates :genre_id
    validates :venue
    validates :detail
    validates :date_start
    validates :date_end
  end

  with_options numericality: { other_than: 1, message: 'を入力してください' } do
    validates :genre_id
    validates :area_id
  end

  validate :date_valid

  private

  def date_valid
    return if date_start.nil? || date_end.nil?

    errors.add(:date_start, 'を過去の日付にすることはできません') if date_start < Date.today
    errors.add(:date_end, 'を過去の日付にすることはできません') if date_end < Date.today
    errors.add(:date_end, 'を開催期間（開始）より過去の日付にすることはできません') if date_start > date_end
  end
end
