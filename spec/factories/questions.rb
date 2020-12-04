FactoryBot.define do
  factory :question do
    category_id { 1 }
    title {"タイトル"}
    text {"テキスト"}
    user
  end
end
