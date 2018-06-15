FactoryBot.define do
  factory :user do
    first_name 'Englebert'
    last_name 'Humperdink'
    email 'test@test.com'
    password 'password'

    factory :user_with_donations do
      transient do
        donations_count 10
      end
      after(:create) do |user, evaluator|
        create_list(:donation, evaluator.donations_count, user: user)
      end
    end
  end
end
