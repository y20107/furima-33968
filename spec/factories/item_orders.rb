FactoryBot.define do
  factory :item_order do
    token               { Faker::Lorem.sentence }
    postal_code         { '111-1111' }
    prefecture_id       { Faker::Number.within(range: 1..47) }
    city                { Faker::Address.city }
    banchi              { '青山1-1-1' }
    building_name       { '柳ビル103' }
    phone_number        { Faker::Number.number(digits: 11) }
  end
end
