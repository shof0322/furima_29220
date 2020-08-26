FactoryBot.define do
  factory :item do
    name                   {Faker::Lorem.sentence}
    explanation            {Faker::Lorem.sentence}
    price                  {Faker::Number.number(digits: 4)}
    category_id            {2}
    status_id              {2}
    delivery_fee_id        {2}
    shipping_origin_id     {2}
    days_until_shipping_id {2}
    association :user
  end
end