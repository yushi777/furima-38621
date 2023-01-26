FactoryBot.define do
  factory :item do
    association :user

    product_name { Faker::Lorem.sentence }
    product_description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    product_condition_id { Faker::Number.between(from: 2, to: 7) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    shipping_charge_id { Faker::Number.between(from: 2, to: 3) }
    delivery_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Faker::Lorem.sentence }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
