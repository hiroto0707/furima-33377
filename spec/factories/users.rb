FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'ひろき'}
    last_name             {'さとう'}
    first_name_kana       {'ヒロキ'}
    last_name_kana        {'サトウ'}
    birthday              {'2000.01.01'}
  end
end