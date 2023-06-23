require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Users
50.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Devise.friendly_token[0, 20],
    bio: Faker::Lorem.paragraph,
    location: Faker::Address.city
  )
  user.save!
  
  # Create Post
  post = user.posts.create(
    body: Faker::Lorem.paragraph
  )
  
  puts "Created user with email: #{user.email}, post: #{post.body}, bio: #{user.bio}, location: #{user.location}"
end
