FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.sentence }
    description           { Faker::Lorem.sentence }
    price                 { 11_111 }
    category_id           { 2 }
    status_id             { 2 }
    cost_id               { 2 }
    prefecture_id         { 2 }
    days_id               { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/endgame.jpg'), filename: 'endgame.jpg')
    end
    association :user
  end
end
