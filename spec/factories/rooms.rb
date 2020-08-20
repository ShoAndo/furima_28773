FactoryBot.define do
  factory :room do
    name { 'name' }
    association :item
  end
end
