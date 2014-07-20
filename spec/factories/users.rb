FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    email
    password "pass"
    factory :admin do
      admin true
    end
  end

end
