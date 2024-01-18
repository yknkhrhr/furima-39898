FactoryBot.define do
  factory :order_address do
    address = Gimei.address

    token {Faker::Crypto.md5}
    postal_code {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    city {address.city.kanji}
    block {address.town.kanji}
    phone_number {Faker::Number.leading_zero_number(digits: 11)}
  end
end