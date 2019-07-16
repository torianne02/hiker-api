FactoryBot.define do 
  factory :hike do 
    name { Faker::Movies::StarWars.character }
    location { Faker::Movies::StarWars.planet }
    distance { Faker::Number.decimal(1) }
    elevation_gain { Faker::Number.number(4) }
    date_completed { Faker::Date.backward(14) }
    # user_id nil
  end 
end 