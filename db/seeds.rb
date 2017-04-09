# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  User.create({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone: Faker::PhoneNumber.cell_phone,
  username: Faker::Superhero.name.downcase,
  profile_picture: Faker::Avatar.image,
  password: "password"
})
end

10.times do
  Challenge.create({
  description: Faker::ChuckNorris.fact,
  price: Faker::Number.number(3),
  challenger_id: rand(1..20),
  acceptor_id: rand(1..20),
  witness_id: rand(1..20)
})
end
