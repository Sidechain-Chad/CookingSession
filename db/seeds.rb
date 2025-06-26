# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
<<<<<<< HEAD
=======
# Clear existing data
Booking.destroy_all
CookingTutorial.destroy_all
User.destroy_all
# Create Users
users = User.create!([
  { email: 'alice@example.com', password: 'password' },
  { email: 'bob@example.com', password: 'password' },
  { email: 'carol@example.com', password: 'password' }
])
puts "Created #{User.count} users"
# Create Cooking Tutorials
tutorials = CookingTutorial.create!([
  {
    title: 'Italian Pasta Making',
    description: 'Learn how to make authentic Italian pasta from scratch.',
    location: 'Cape Town',
    date: DateTime.now + 3.days,
    user: users[0]
  },
  {
    title: 'Sushi Rolling Basics',
    description: 'Master the basics of sushi rolling with our expert chefs.',
    location: 'Johannesburg',
    date: DateTime.now + 5.days,
    user: users[1]
  },
  {
    title: 'Bread Baking 101',
    description: 'A beginner-friendly guide to baking delicious bread at home.',
    location: 'Durban',
    date: DateTime.now + 7.days,
    user: users[2]
  }
])
puts "Created #{CookingTutorial.count} cooking tutorials"
# Create Bookings
Booking.create!([
  { user: users[1], cooking_tutorial: tutorials[0], confirmed: true },
  { user: users[2], cooking_tutorial: tutorials[1], confirmed: false },
  { user: users[0], cooking_tutorial: tutorials[2], confirmed: true }
])
puts "Created #{Booking.count} bookings"
>>>>>>> origin/foundation-code
