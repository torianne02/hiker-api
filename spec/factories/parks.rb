FactoryBot.define do 
  factory :park do 
    name { Faker::Movies::StarWars.planet }
    location { Faker::Address.city }
    type { ['State', 'City', 'Regional', 'Federal', 'Private'].sample }
  end 
end 