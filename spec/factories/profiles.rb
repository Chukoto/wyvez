FactoryBot.define do
  factory :profile do
    trans_exp_id { 1 }
    papa_exp_id { 1 }
    text {"テキスト"}
    user
  end
end