FactoryBot.define do 
  factory :hike do 
    name { Faker::Movies::StarWars.character }
    # location { Faker::Movies::StarWars.planet }
    # user_id nil
  end 
end 