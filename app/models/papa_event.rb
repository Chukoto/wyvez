class PapaEvent < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :do_what
  belongs_to_active_hash :status

  belongs_to :user
  belongs_to :papa

  with_options presence: false do
    validates :finished_at
    validates :todo
    validates :place
    validates :reward
  end

  with_options presence: true do
    validates :started_at
    validates :do_what_id, numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :expected_reward
  end
end
