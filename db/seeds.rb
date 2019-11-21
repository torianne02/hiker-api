# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do 
 User.create(
   name: Faker::Name.first_name, 
   username: Faker::Internet.username, 
   password: Faker::Internet.password, 
   birthday: Faker::Date.birthday, 
   gender: Faker::Gender.binary_type,
   email: Faker::Internet.email
  )

  Hike.create(
    name: Faker::Book.title, 
    location: Faker::Address.city,
    park_id: Faker::Number.within(1..15)
   )

   UserHike.create(
    distance: Faker::Number.decimal(1), 
    elevation_gain: Faker::Number.number(4), 
    date_completed: Faker::Date.backward(14),
    rating: Faker::Number.within(1..5),
    comment: Faker::TvShows::GameOfThrones.quote,
    # duration: 
    user_id: Faker::Number.within(1..15),
    hike_id: Faker::Number.within(1..15)
   )

   Park.create(
     name: Faker::Movies::StarWars.planet,
     location: Faker::Address.city,
     park_type: ["federal", "state", "city", "regional"].sample
   )
end
