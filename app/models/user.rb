class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.nickname = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :questions
  has_many :comments
  has_many :bookmarks
  has_many :questions, through: :bookmarks
  has_many :papas, dependent: :destroy
  has_many :papa_events, dependent: :destroy
  has_many :beauty_events
  has_one  :profile

  with_options presence: true do
    validates :nickname
  end
end
