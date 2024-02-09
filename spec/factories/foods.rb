FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Test food #{n}" }
    measurement_unit { "ponds" }
    price { rand(1..100) }
    quantity { rand(1..200) }
    association :user
  end
end