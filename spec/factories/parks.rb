FactoryBot.define do 
  factory :park do 
    name { Faker::Movies::StarWars.planet }
    location { Faker::Address.city }
    park_type { ['State', 'City', 'Regional', 'Federal', 'Privately Owned'].sample }
  end 
end 