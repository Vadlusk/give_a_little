FactoryBot.define do
  factory :disaster do
    rw_id 8593
    sequence(:type) { %w[flood hurricane mudslide earthquake].sample }
    country 'United States of America'
    location ({ lat: -25.344, lng: 131.036 })
    description Faker::Lorem.paragraph
    number_affected 600
  end
end
