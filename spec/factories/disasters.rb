FactoryBot.define do
  factory :disaster do
    lat_long ({ lat: -25.344, lng: 131.036 })
    sequence(:type) { %w[flood hurricane mudslide earthquake].sample }
    location 'United States of America'
    number_affected 600
    description Faker::Lorem.paragraph
    rw_id 8593
  end
end
