class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_many :comments
  has_many :bookmarks
  has_many :users, through: :bookmarks

  has_one_attached :image

  with_options presence: true do
    validates :category_id, numericality: { other_than: 0 }
    validates :title
    validates :text
    validates :image, presence: false, unless: :was_attached?
  end

  def was_attached?
    image.attached?
  end
end
