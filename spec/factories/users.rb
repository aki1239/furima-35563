FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ナナ' }
    first_name_kana       { 'ハチ' }
    birth_date            { Faker::Date.birthday }
  end
end
