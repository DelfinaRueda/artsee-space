require 'faker'

require 'net/http'
require 'uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroy old data...'
Order.destroy_all
Artwork.destroy_all
Gallery.destroy_all
User.destroy_all
Event.destroy_all

puts 'Creating users...'

profile_pics = []
results = Cloudinary::Api.resources(max_results: 500,type:"upload",prefix:"avatars/")
results['resources'].each {|resource| profile_pics << resource['public_id']}
puts "- Profile pics louded (#{profile_pics.count})"

puts '- Custom users...'

user = User.new(
    first_name: "Arthur",
    last_name: "Seebert",
    email: "artsee@gmail.com",
    password: "123456789",
    username: "artsee",
    phone_number: "12345678910",
    profile_pic: profile_pics[0],
)
user.save!
puts '- 35 users...'

user_counter = 2
35.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.unique.first_name}@gmail.com",
    password: "123456789",
    username: Faker::Games::Pokemon.unique.name.downcase,
    phone_number: "12345678910",
    profile_pic: profile_pics[user_counter],
    description: Faker::TvShows::RickAndMorty.quote.slice(0,250),
  )
  user.save!
  user_counter += 1
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
  puts "- Add 5-15 Artworks to user"
  rand(5..15).times do

    res = Net::HTTP.get_response(URI(["https://source.unsplash.com/collection/5057079", "https://source.unsplash.com/collection/219941", "https://source.unsplash.com/collection/762960", "https://source.unsplash.com/collection/190727"].sample))
    artwork = Artwork.new(
      title: Faker::Ancient.primordial,
      category: ["painting", "photograph", "drawing", "illustration", "cartoon", "anime"].sample,
      description: Faker::TvShows::RickAndMorty.quote + Faker::TvShows::RickAndMorty.quote + Faker::TvShows::RickAndMorty.quote + Faker::TvShows::RickAndMorty.quote + Faker::TvShows::RickAndMorty.quote,
      gallery_id: Gallery.where(user_id: user.id).first.id,
      user_id: user.id,
      dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
      artwork_pic: res['location'].sub(/\?.*/, ""),
      price_cents: rand(100..1000),
      views: rand(1..1999)
    )
    artwork.save!
  end
end

puts 'Creating orders...'

20.times do
  User.all.sample(50).each do |user|
  order = Order.new(
    state: "paid",
    user_id: user.id,
    artwork_id: Artwork.all.sample.id,
    )
  order.save!
  artwork = Artwork.find(order.artwork_id)
  artwork[:sales] += 1
  artwork.save!
  end
end

user = User.new(
    first_name: "Vinvan",
    last_name: "Go",
    email: "vinny@gmail.com",
    password: "123456789",
    username: "discount_vancough",
    phone_number: "12345678910",
    profile_pic: profile_pics[1],
)
user.save!

gallery = Gallery.new(
  user_id: User.find_by(username: "discount_vancough").id,
  )
gallery.save!

puts 'Creating events...'

counter = 0
15.times do
  location = ["Cavendish Conference Centre", "Royal Academy of Arts" , "Sir John Soane's Museum", "Camden Arts Centre", "The Bridewell Theatre", "Tate Modern", "Parasol Unit, Islington", "Hayward Gallery", "Institute of Contemporary Arts", "National Gallery", "National Portrait Gallery", "Serpentine Gallery", "Tate Britain", "Wallace Collection", "Whitechapel Gallery"]
  event = Event.new(
    name: Faker::Name.first_name + " " +  Faker::Name.last_name,
    fee: rand(5..20),
    location: location[counter],
    date: "#{rand(6..12)}Dec"
  )
  counter += 1
  event.save!
end

puts 'Finished!'
