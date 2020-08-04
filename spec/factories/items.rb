FactoryBot.define do
  factory :item do
    name { 'サンプルデータ' }
    text { 'サンプルサンプルサンプルサンプル' }
    price { 1000 }
    category_id { 3 }
    item_status_id { 3 }
    delivery_burden_id { 2 }
    prefecture_id { 14 }
    send_date_id { 3 }
    association :user
  end
end
