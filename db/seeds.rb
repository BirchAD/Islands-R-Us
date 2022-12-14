# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
puts "cleaning the database..."
Island.destroy_all

puts "creating new islands..."
10.times do
  Island.create!(name: Faker::Mountain.name, price: rand(2000..9000), location: Faker::Nation.capital_city, user: User.first)
end

puts "created #{Island.count} island"
