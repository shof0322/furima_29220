FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, max_length: 6) }
    password_confirmation { password }
    name_first  {'山田'}
    name_last  {'太郎'}
    name_kana_first  {'ヤマダ'}
    name_kana_last  {'タロウ'}
    birthday  {'1989-03-22'}
  end
end
