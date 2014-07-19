# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@example.com" }
  factory :user do
    email
    password "test12"
  end
end
