FactoryBot.define do
  factory :item do
    name { Faker::Name.initials }
    text { Faker::Name.name_with_middle }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 11 ) }
    item_status_id { Faker::Number.between(from: 2, to: 7) }
    delivery_burden_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    send_date_id { Faker::Number.between(from: 2, to: 4) }
    association :user

  end
end
