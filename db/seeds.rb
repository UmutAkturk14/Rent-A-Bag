# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing the user database..."
Offer.destroy_all
User.destroy_all

puts "Populating the database with new users.."

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    role: ["buyer", "seller"].sample
  )
  puts "I am creating a user with id #{user.id}"
end

puts "All done! "


puts "Populating the database with new offers.."

20.times do
  offer = Offer.create!(
    title: Faker::Quote.robin,
    brand: ["Louis Vuitton", "Celine", "Gucci", "Hermes", "Marni"].sample,
    condition: ["Never worn", "Very good", "Fair"].sample,
    price: rand(100..5000),
    city: Faker::Nation.capital_city,
    status: ["available", "not_available"].sample,
    user_id: User.all.sample.id
  )
  puts "I am creating an offer with id #{offer.id}"
end

puts "All done! "
