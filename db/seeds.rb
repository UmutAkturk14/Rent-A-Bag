# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Offer.create!([{ title: "JACKIE 1961 LEATHER HANDBAG" }, {brand: "Gucci" },
#              { condition: "Good" }, { price: 550 }, { city: "Hamburg" }])

# Offer.create!([{title: "SAC DE JOUR LEATHER TOTE" }, { brand: "Saint Laurent" },
 #             { condition: "Fair"}, { price: 1100 }, { city: "Paris" }])

# Offer.create!([{title: "LADY DIOR PATENT LEATHER HANDBAG"}, {brand:"Dior"},
  #            { condition: "Good"}, { price: 1880}, {city: "London"}])

# Offer.create!([{ title: "ARCO LEATHER HANDBAG" }, { brand: "Bottega Veneta" },
   #           { condition: "Good" }, { price: 1615 }, { city: "Vienna" }])

# Offer.create!([{ title: "Chanel Medium Denim Patchwork Boy" }, { brand: "Chanel" },
    #          { condition: "Good" }, { price: 2931 }, { city: "Dubai" }])

# Offer.create!([{ title: "LOULOU LEATHER CROSSBODY BAG" }, { brand: "Saint Laurent" },
    #          { condition: "Good" }, { price: 1350 }, { city: "Madrid" }])

require "open-uri"

puts "Clearing the user database..."
Review.destroy_all
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
  file = URI.open("https://source.unsplash.com/random?handbag")
  offer = Offer.new(
    title: Faker::Quote.robin,
    brand: ["Louis Vuitton", "Celine", "Gucci", "Hermes", "Marni"].sample,
    condition: ["Never worn", "Very good", "Fair"].sample,
    price: rand(100..5000),
    city: Faker::Nation.capital_city,
    status: ["available", "not_available"].sample,
    user_id: User.all.sample.id
  )
  offer.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  offer.save
  puts "I am creating an offer with id #{offer.id}"
end

puts "All done!"
