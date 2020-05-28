FactoryBot.define do 
  factory :hike do 
    name { Faker::Movies::StarWars.character }
  end 
end 