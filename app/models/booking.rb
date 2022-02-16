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
    unless date_start == nil || date_end == nil
      errors.add(:date_start, "can't be in the past date") if date_start < Date.today
      errors.add(:date_end, "can't be in the past date") if date_end < Date.today
      errors.add(:date_end, "can't be dated earlier than the start") if date_start > date_end
    end
  end

end
