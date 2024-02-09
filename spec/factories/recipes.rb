FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    preparation_time { rand(1..60) }
    cooking_time { rand(1..180) }
    description { Faker::Food.description }
    public { true }
    association :user
  end
end