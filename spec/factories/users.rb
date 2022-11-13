FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '齊藤' }
    first_name            { '幸太' }
    sei_kana              { 'サイトウ' }
    mei_kana              { 'コウタ' }
    birthday              { 19_950_804 }
  end
end
