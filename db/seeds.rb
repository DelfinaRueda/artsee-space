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

main_user = User.new(
    first_name: "Delfina",
    last_name: "Rueda",
    email: "delfina@gmail.com",
    password: "123456789",
    username: "DelfiRueda",
    phone_number: "07789413753",
    description: "London based Argentine amateur photographer. My work explores the relationship between Pre-raphaelite tenets and unwanted gifts. With influences as diverse as Machiavelli and Francis Bacon, new tensions are distilled from both mundane and transcendant structures.

Ever since I was a postgraduate I have been fascinated by the traditional understanding of meaning. What starts out as triumph soon becomes debased into a tragedy of defeat, leaving only a sense of nihilism and the dawn of a new beginning.

As shimmering derivatives become distorted through emergent and repetitive practice, the viewer is left with an insight into the possibilities of our future."
)
main_user.save!

gallery = Gallery.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  )
gallery.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Summer days",
  category: "photograph",
  price_cents: rand(10..100),
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://images.unsplash.com/photo-1556718205-1de7550f698d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  description: "Just like childhood needs a certain level of innocence, a warm summer needs a bicycle. Flying down with the wind in your hair creates a sense of freedom and immaturity. Bare image that mirrors the simplicity of a lazy summer.",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Skater boi",
  price_cents: rand(10..100),
  category: "photograph",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://dvqlxo2m2q99q.cloudfront.net/000_clients/704852/page/h800-704852O5t1qK8A.jpg",
  description: "In a similar manner to my practice of demonstrating the dynamism and unfixity of identity through constant character transformations, the installations will demonstrate the same through their cycles of transformation. Each installation space parodies real-world, real spaces: studio, office, commercial, domestic, etc. Each space will be open to the viewer as participant/user; the manner in which they participate with, or use it will be dependent on the identity of each installation. Each space will be inhabited and uninhabited at different times to play with presence and absence. Each will aim to antagonize, upset, frustrate and/or agitate the viewer through different anti-social strategies that will include: parody, deceit, surveillance and theft.",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Lover Boy",
  price_cents: rand(10..100),
  category: "photograph",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://images.unsplash.com/photo-1571968225811-2b1e379840ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  description: "Wandering the streets all through the night searching for the one to make me right. Wondering if she's the shade of youc and if so, should I try to see it through? Darling, i got my trust issues, warning, you stay away. If we meet at the rendezvous take me away, sunray. Darling, I got my trust issues, warning, you stay away. Time and toys may fill my heart with joy but I'll know peace when I'm your lover boy.",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Blinding",
  price_cents: rand(10..100),
  category: "photograph",
  description: "No text also means no context. You're free to enjoy the images in their purest form, without names, labels, definitions, or purpose. It makes the pictures we see across the web more mysterious and open to interpretation of our own imaginations.",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "http://ayemag.com/wp-content/uploads/2017/09/IMG_2790.jpg",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!


artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Flower man",
  price_cents: rand(10..100),
  category: "photograph",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  description: "Inspired by science fictional depictions of arid worlds and the cultural practices that develop around water scarcity, this piece envisions a propositional social ritual that has developed in response to the growing threat of water scarcity in California. Through a combination of diegetic prototypes and video, Water Rites explores a slice of uncanny, fictitious culture from a world where our relationship to water is far less cavalier.",
  artwork_pic: "https://dvqlxo2m2q99q.cloudfront.net/000_clients/704852/page/h800-704852poqgJ31r.jpg",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Joy of film",
  price_cents: rand(10..100),
  category: "photograph",
  description: "In a similar manner to my practice of demonstrating the dynamism and unfixity of identity through constant character transformations, the installations will demonstrate the same through their cycles of transformation. Each installation space parodies real-world, real spaces: studio, office, commercial, domestic, etc. Each space will be open to the viewer as participant/user; the manner in which they participate with, or use it will be dependent on the identity of each installation. Each space will be inhabited and uninhabited at different times to play with presence and absence. Each will aim to antagonize, upset, frustrate and/or agitate the viewer through different anti-social strategies that will include: parody, deceit, surveillance and theft.",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://images.unsplash.com/photo-1556718205-a5b7d00c8544?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "love",
  price_cents: rand(10..100),
  category: "photograph",
  description: "This work is a disembodied and disguised, cartoonesque hallucinatory montage consisting of panoramas of present-day Tokyo and Beirut which is reminiscent of landscape and the body.",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://images.unsplash.com/photo-1541164757216-e5c2c2b5d69b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Yellow",
  price_cents: rand(10..100),
  category: "photograph",
  description: "My work explores the relationship between Critical theory and emotional memories. With influences as diverse as Derrida and Joni Mitchell, new synergies are distilled from both orderly and random narratives.",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://images.unsplash.com/photo-1488702953093-ac0820558db2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

artwork = Artwork.new(
  user_id: User.find_by(username: "DelfiRueda").id,
  title: "Window",
  price_cents: rand(10..100),
  category: "photograph",
  description: "My work explores the relationship between Critical theory and emotional memories. With influences as diverse as Derrida and Joni Mitchell, new synergies are distilled from both orderly and random narratives.",
  dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
  artwork_pic: "https://images.unsplash.com/photo-1501579672668-68e6b414451b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  gallery_id: Gallery.where(user_id: user.id).first.id
)

artwork.save!

puts "Delfi = main_user"

puts 'Finished!'
