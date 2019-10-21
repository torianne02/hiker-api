FactoryBot.define do
  factory :user do 
    name { Faker::TvShows::NewGirl.character }
    username { Faker::Name.initials }
    password { Faker::String.random(8) }
    birthday { Faker::Date.birthday }
    gender { Faker::Gender.binary_type }
  end
end