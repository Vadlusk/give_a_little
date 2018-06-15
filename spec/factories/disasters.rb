FactoryBot.define do
  factory :disaster do
    date Time.parse("2018-05-23T00:00:00+00:00")
    sequence(:type) { %w[flood hurricane mudslide earthquake].sample }
    country 'United States of America'
    latitude (-25.344)
    longitude 131.036
    description Faker::Lorem.paragraph
    rw_id 8593
  end
end
