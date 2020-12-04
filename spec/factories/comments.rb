FactoryBot.define do
  factory :comment do
    user
    question
    text { "テキスト" }
  end
end
