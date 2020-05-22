FactoryBot.define do 
  factory :user_hike do
    distance { Faker::Number.decimal(1) }
    elevation_gain { Faker::Number.number(4) }
    date_completed { Faker::Date.backward(14) }
    total_time { Faker::Number.within(30..180) }
    rating { Faker::Number.within(1..5) }
    comment { Faker::TvShows::StrangerThings.quote }
  end 
end 