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
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
    validates :area_id
  end
end
