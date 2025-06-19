# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "json"

puts "Cleaning up database..."
CookingTutorial.destroy_all
puts "Database cleaned"
CookingTutorial.create(title:"Mutton Stew", description: "Potoatoes, Tomatoes, Carrots, Onions, Mutton Chops, Herbs and Spices", location: "Durban", date: "2 June 2025")
CookingTutorial.create(title:"Rainbow Sushi", description: "Salmon, Rice, Avocados, Seaweed Wrap", location: "Japan", date: "19 July 2025")
CookingTutorial.create(title:"Chicken and Chips", description: "Chicken Pieces, Frozen Chips, Spices and Jimmy Sauce", location: "Kensington", date: "21 July 2025")
puts "Seed file complete, #{CookingTutorial.count} tuts created."
