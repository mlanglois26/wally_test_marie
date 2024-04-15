# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "Destroy all Resources..."

User.destroy_all
Flat.destroy_all
Booking.destroy_all

puts "-----------------------------------------------------"

PRICE = %w[25 28 49 55 61 77 108 133]

RATING = %w[1 2 3 4 5]

ADDRESS = ["26 rue de la montagne sainte genevieve",
          "68 avenue parmentier",
          "7 rue lisse des cordeliers",
          "la rotonde",
          "134 quai de voila",
          "3 rue des acacias"]

CITY = ["Paris", "Lyon", "Lille", "Bordeaux", "Toulouse"]

ZIP = %w[75012 94100 26000 45270 59560 62471]

PHONE_NUMBER = %w[0645224500 0606060606 0736124785 0632146598]

PHOTO_URL = ["https://res.cloudinary.com/djumrtj1m/image/upload/v1713007814/test_wally_1_uqqgww.jpg",
"https://res.cloudinary.com/djumrtj1m/image/upload/v1713019142/wally_2_r6fxbc.jpg",
"https://res.cloudinary.com/djumrtj1m/image/upload/v1713019149/wally_3_et356b.jpg"]

puts "-----------------------------------------------------"

puts "Initializing users..."

admin_user = User.create(
  role: "admin",
  first_name: "Martin",
  last_name: "L'Admin",
  email: "admin@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)


owner_1 = User.create(
  role: "owner",
  first_name: "Eric",
  last_name: "Dupond",
  email: "eric@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)

owner_2 = User.create(
  role: "owner",
  first_name: "Marc",
  last_name: "Moreau",
  email: "marc@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)

owner_3 = User.create(
  role: "owner",
  first_name: "Eva",
  last_name: "Lacour",
  email: "eva@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)

tenant_1 = User.create(
  role: "tenant",
  first_name: "Alex",
  last_name: "Grimm",
  email: "alex@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)

tenant_2 = User.create(
  role: "tenant",
  first_name: "Lili",
  last_name: "Swan",
  email: "lili@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)

tenant_3 = User.create(
  role: "tenant",
  first_name: "Sam",
  last_name: "Benoit",
  email: "sam@mail.com",
  password: "password",
  address: ADDRESS.sample,
  city: CITY.sample,
  zip: ZIP.sample,
  phone_number: PHONE_NUMBER.sample
)

puts "users created"

puts "-----------------------------------------------------"

puts "Initializing Flats..."

5.times do

flat_1 = Flat.create(
  name: "Apart 1",
  price_per_night: PRICE.sample,
  address: ADDRESS.sample,
  rating: RATING.sample,
  city: CITY.sample,
  user_id: owner_1.id #revoir ca make sure it s an owner
)

# image_path = Rails.root.join('app', 'assets', 'images', 'wally_2.jpg')
# flat_1.photos.attach(io: File.open(image_path), filename: 'wally_2.jpg')

# PHOTO_URL.shuffle.each { |url| flat_1.photos.attach(io: URI.open(url), filename: "seed.png") }
# flat_1.photos.attach(io: URI.open("https://res.cloudinary.com/djumrtj1m/image/upload/v1713019149/wally_3_et356b.jpg"), filename: "seed.png")


flat_2 = Flat.create(
  name: "Apart 2",
  price_per_night: PRICE.sample,
  address: ADDRESS.sample,
  rating: RATING.sample,
  city: CITY.sample,
  user_id: owner_2.id
)

end

flat_3 = Flat.create(
  name: "Apart 3",
  price_per_night: PRICE.sample,
  address: ADDRESS.sample,
  rating: RATING.sample,
  city: CITY.sample,
  user_id: owner_3.id
)

puts "flats created"

puts "-----------------------------------------------------"

puts "Initializing bookings..."

date_start = Date.new(2023, 4, rand(1..9))
date_end = Date.new(2023, 4, rand(10..28))

booking = Booking.new(
  start_date: date_start,
  end_date: date_end,
  price: Flat.all.sample.price_per_night * (date_end - date_start).to_i,
  user_id: tenant_2.id,
  flat_id: flat_3.id
)

puts "bokking created"

puts "-----------------------------------------------------"

puts "seed done"
