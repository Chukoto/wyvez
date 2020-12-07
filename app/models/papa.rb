class Papa < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :age
  belongs_to_active_hash :marriage
  belongs_to_active_hash :child

  belongs_to :user
  has_many :papa_events, dependent: :destroy

  has_one_attached :image

  validates :image, presence: false, unless: :was_attached?
  validates :memo, presence: false

  with_options presence: true do
    validates :name
    validates :age_id, numericality: { other_than: 0 }
    validates :marriage_id, numericality: { other_than: 0 }
    validates :child_id, numericality: { other_than: 0 }
    validates :app_name, length: { maximum: 40 }
  end

  def was_attached?
    image.attached?
  end
end
