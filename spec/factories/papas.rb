FactoryBot.define do
  factory :papa do
    name  {Faker::Name}
    age_id { 1 }
    marriage_id { 1 }
    child_id { 1 }
    app_name { "アプリ名" }
    memo { "メモ" }
    user
  end
end
