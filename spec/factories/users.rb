FactoryBot.define do
  factory :user do
      sequence(:email) { |n| "person-#{n}@example.com" }
      password { '123greetings' }
      trait :ta do
        account_id { 0 }
      end
      trait :teacher do
        account_id { 1 }
      end
  end
end
