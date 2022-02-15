class Booking < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
    validates :area_id
  end
end
