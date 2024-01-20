FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    detail {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from:1, to:10)}
    status_id {Faker::Number.between(from:1, to:6)}
    fee_burden_id {Faker::Number.between(from:1, to:2)}
    prefecture_id {Faker::Number.between(from:1, to:47)}
    send_day_id {Faker::Number.between(from:1, to:3)}
    price {Faker::Number.between(from:300, to:9999999)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
