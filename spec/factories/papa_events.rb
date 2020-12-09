FactoryBot.define do
  factory :papa_event do
    started_at { Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all) }
    do_what_id { 1 }
    expected_reward { 5000 }
    reward { 5000 }
    status_id { 1 }
    user
    papa
  end
end
