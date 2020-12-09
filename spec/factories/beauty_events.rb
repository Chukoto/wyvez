FactoryBot.define do
  factory :beauty_event do
    beauty_cate_id { 1 }
    started_at { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) }
    status_id { 1 }
    user
  end
end
