class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  belongs_to :sex
  belongs_to :area
  belongs_to :part
  belongs_to :genre

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 半角英数混合1字以上
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  validates :nickname, presence: true
end
