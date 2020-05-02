# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
motorcycle_makes = ["Honda", "Kawasaki", "Suzuki", "Ducati", "Aprilla", "Harley", "Yamaha"]
motorcycle_models = ["Ninja", "Monster", "GXR", "Fireblade", "YZF"]
motorcycle_types = ["Sport", "Touring", "Dual-Sport", "Dirtbike", "Street", "Cruiser", "Chopper"]
engine_sizes = [1000, 600, 800, 400, 250,]
adjectives = ["Amazing", "Fantastic", "Incredible", "Badass", "Chingon"]


Motorcycle.delete_all

10.times do
  user = User.create(email: Faker::Internet.email, password:'password' , password_confirmation: 'password')
  motorcycle = Motorcycle.create(user: user, brand: motorcycle_makes.sample, motorcycle_type: motorcycle_types.sample, model: motorcycle_models.sample, engine_size: engine_sizes.sample, price_per_day: rand(50..200), description: "Wow what a great motorcycle", year: rand(1975..2020), title: "#{adjectives.sample} New Motorcycle For Rent", address: "Mexico City")
  puts "#{motorcycle.model}  Added!"
end
