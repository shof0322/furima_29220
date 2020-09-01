FactoryBot.define do
  factory :purchase_buyer do
    user_id       {'1'}
    item_id       {'1'}
    postal_code   {'111-2222'}
    prefecture_id { '2' }
    city          { '東京都' }
    address       { '１−１' }
    building      { 'ビル' }
    phone_num     { '09012345678' }
  end
end
