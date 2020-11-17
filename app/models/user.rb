class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :comments
  has_many :bookmarks
  has_many :questions, through: :bookmarks
  has_many :papas, dependent: :destroy
  has_many :papa_events, dependent: :destroy
  has_many :beauty_events
  has_one  :profile

  enum gender: { yet: 0, already: 1 }

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :birthday
    validates :gender
  end
end
