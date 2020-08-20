FactoryBot.define do
  factory :message do
    content { 'こんにちは' }
    association :user
    association :room

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixture/indigolaend.jpg'), filename: 'indigolaend.jpg', content_type: 'image/jpg')
    end
  end
end
