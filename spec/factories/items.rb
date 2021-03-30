FactoryBot.define do
  factory :item do
    name               {Faker::Name.initials(number: 2)}
    description        {'ああああああああ'}
    status_id          {2}
    category_id        {2}
    delivery_fee_id    {2}
    area_id            {2}
    day_id             {2}
    price              {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end