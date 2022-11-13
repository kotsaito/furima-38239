FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password               { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '齊藤' }
    first_name            { '幸太' }
    sei_kana              { 'サイトウ' }
    mei_kana              { 'コウタ' }
    birthday              { '1995-08-04' }
  end
end
