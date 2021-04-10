FactoryBot.define do
  factory :user_donation do
    area_id            {2} 
    municipalities     {"藤沢市"} 
    address            {"藤沢0-0-0"}
    building_number    {"藤沢ビル111"}
    postal_code        {"123-4567"} 
    phone_number       {"00011112222"} 
    token     {"tok_abcdefghijk00000000000000000"}
  end
end