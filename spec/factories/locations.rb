FactoryGirl.define do
  factory :location do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.email }
  end
end
