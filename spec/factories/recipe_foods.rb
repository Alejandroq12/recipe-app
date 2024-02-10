FactoryBot.define do
  factory :recipe_food do
    quantity { rand(1..56) }
    association :food
    association :recipe
  end
end
