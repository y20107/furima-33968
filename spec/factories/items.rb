FactoryBot.define do
  factory :item do
    image                 { Faker::Lorem.sentence }
    title                 { Faker::Lorem.sentence }
    item_description      { Faker::Lorem.sentence }
    category_id           { Faker::Number.within(range: 1..10) }
    item_state_id         { Faker::Number.within(range: 1..6) }
    shipping_cost_id      { Faker::Number.within(range: 1..6) }
    prefecture_id         { Faker::Number.within(range: 1..47) }
    shipping_time_id      { Faker::Number.within(range: 1..3) }
    cost                  { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
