FactoryBot.define do
  factory :user_pay do
    post_number   {'123-4567'}
    prefecture_id { 14 }
    city          {"豊島区"}
    address       {"1-1-1"}
    building      {"ハイツ202"}
    phone_number  { '09012345678' }
    item_id       { 6 }
    price         { 2000 }
    user_id       { 3 }
  end
end
