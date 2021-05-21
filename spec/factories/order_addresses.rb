FactoryBot.define do
  factory :order_address do
    post_code                  { "121-0021" }
    prefecture_id              { 2 }
    city                       { "東京" }
    home_number                { '2' }
    building_name              { '2' }
    phone_number               { "08023234321" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
