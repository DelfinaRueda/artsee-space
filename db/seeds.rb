require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artwork.destroy_all
Gallery.destroy_all
User.destroy_all

puts 'Creating users...'

50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.unique.first_name}@gmail.com",
    password: "123456789",
    username: Faker::Games::Pokemon.unique.name.downcase,
    phone_number: "12345678910",
  )
  user.save!
end

puts 'Creating galleries...'

User.all.each do |user|
  gallery = Gallery.new(
    user_id: user.id,
    )
  gallery.save!
end

puts 'Creating artworks...'

User.all.each do |user|
  rand(1..10).times do
    artwork = Artwork.new(
      category: ["painting", "photograph", "drawing", "illustration", "cartoons", "anime"].sample,
      description: Faker::TvShows::RickAndMorty.quote,
      gallery_id: Gallery.where(user_id: user.id).first.id,
      user_id: user.id,
      artwork_pic: "https://images.unsplash.com/photo-1502842294453-95e49a5ce544?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
    )
    artwork.save!
  end
end

puts 'Finished!'
