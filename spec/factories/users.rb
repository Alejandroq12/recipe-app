FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Test user #{n}" }
    email { Faker::Internet.email }
    password { 'testpassword' }

    after(:create) do |user, evaluator|
      user.confirm
    end
  end
end
