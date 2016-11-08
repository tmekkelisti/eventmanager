FactoryGirl.define do
  factory :event do
    name { Faker::Company.name }
    description { Faker::StarWars.quote }
    location_id { Faker::Number.number(2) }
    start_time { Faker::Date.forward(7) }
    end_time { Faker::Date.forward(14) }
    user
  end
end
