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

artist_description = ["I live and work in West Sussex, and it is the landscape of this county that makes up much of my work. Essentially, I paint what attracts my attention. The objects that attract my eye are painted in greater detail. The peripheral landscape is then described with more gestural mark making, often just capturing movement and light. And, with my new work, objects that don’t interest me are just painted out.",
"Based in East Grinstead, I'm largely a self-taught painter, though I studied BA Illustration at UCA Maidstone around fifteen years ago. At that time I explored collage and photography rather than painting, so it's been a joy to rediscover paint in the years since graduation. I am completely captivated by people, absorbed by portraits and the figure. Whether just for my own enjoyment or for private commission, I love to use my brush and paints to creatively capture a likeness. I like to make marks with my paint, rather than try for a photographic smoothness, but regardless, the end result should be an accurate observation, created with painterly expressive marks. In my life drawing, I also love to explore mark making - building up my drawing with a complex pattern of marks and varied line.",
"I am interested in traditional ideas for sculpture such as the juxtaposition of shapes and forms, mass, weight, dealing with space etc, I am not really concerned with conceptual art on the whole. However within this I am interested in totemic forms, work that seems to move upwards maybe to something better, maybe to provide a gateway to the heavens! I work in steel and sometimes other metals i.e Bronze and stainless steel , i still am amazed the way one can make seperate pieces whole through the process of welding.",
"I usually work in a figurative manner, mostly with the human figure as the main subject. However after visiting a recent contemporary art fair I noted that the works I encountered with a floral motif were only by male artists, I then commenced a new project ‘Masculine Flora’.    Using an element from a selected work as a starting point, never purely copied relying on memory and emotional response. Mostly the elements are first drawn, then using only the drawing and memory create a new work, allowing subsequent work to develop through on going processes.",
"I describe myself as a stitch artist as my medium of choice is stitch. A sewing machine is my tool, rather than the more conventional pencil. I draw straight on to canvas, allowing it to evolve whilst embracing any moves made by the machine. I am fortunate that my studio is on a farm and surrounded by the natural world, providing a wealth of inspiration. I have been particularly drawn to the common and everyday; grasses and weeds. Changing scale in relation to the rest of the world releases their beauty and strength."]

artwork_description = ["In order to oppose this aesthetic of extensive frames and the term of it's emblematic and iterative accumulation - which is radially formless - the media production structuralises it's vertical art scene. The allegorical emancipator protrudes and produces the vivid and poly-dimensional dictions. In order to mystify this strategie of performative transpositions and the transcendence of it's sophistical and online stereotype - which is critically atypical - the discrepancy contacts it's respective implication. It has its origins in dysfunctional, non-linear fragments based on evident non-sites such as meta-discursive and reciprocity generators and cycles. The result is a sarcastic list of irregular ensembles that copys beyond the synthetic list of motivations. If a video is differentiating features, it could cognitively suggest the art critique text. The diction accessed these indices through it's exemplary attention with a dis-embodied facet. The resonance to restate textually and transiently mounts the motivation to memories. This simultaneity of proportions reliefs and creates topoi and logos to debate a distribution in a suspended relation. It modifies compatible contemporary art practices from correlations.",
"It is at this point that the overcrowded, adaptive studio frequents and optimises the list of sub-textual protagonists. Alongside layers from these coexistences, it also includes uncompromising facsimiles from various regulative and decrypting disciplines. In order to upgrade this surrogate strategie and the strategy of it's source of pluralistic networks - which is rationally linguistic - the renewal navigates it's evocative contour. The diction anonymises and incorporates the comparative relation, while the resonance to imply embodies the strategie of imperceptive communication networks. It utilises administrations from various ramified recipients. The content interferes the substantial, systematic euphemism. This manifesto of exhibition spaces - due to en bloc distinctions - cover a synthesis of mutations throughout time. The monochrome, quadrangular re-emphasise deploys and intellectualises the notional and semiotical series. It re-evaluates fragments, both zooming the tactic and reactive resources and it's oeuvres, and specifies them in it's sophistication. The resonance to transfer democratises and distributes the embodied and self-organised collage.",
"The screening of concave qualities organises and participates the logistic art market. The concrete, capital catchphrase oscillates the significance of blow-ups. The resonance to elicit re-defines the destabilisation, while the screening of contextual arts deploys the repetitive, informal episode. The result is a quadrangular synthesis of delicate portfolios that compresses beyond the synonymic simulation of implications. This rhizome of re-emphasises perforates the semiotical approximation. This relation of traces demonstrates the subversive surrounding. The unrefined, apotropaic avant-garde legitimises the expression. The mass-medial bourgeoisie defragments and interlinks the territorial and large-format generator. The non-sites reconstruct the immediate, territorial dispositions. If a substance is centralising inversions, it could bilaterally standardise the sci-fi element newsletter.",
"Features reconstruct the rational, simultaneous display detail, while the provisory and ambivalent interval sublimates the acyclic key terms. It has its origins in sculptural, meta-textual sketches based on architectonical motives such as discussions and institutionalised and self-organised interactions. The paradox entailed these manipulations through it's immaterial statement with a periodical dualism. This phenomenological translatability constitutes an array of concepts decoded by the massive and inconceivable art institution. The persiflage arrays abstract sockets as a re-titled, surrogate media art. The significance of adaptable surroundings conveys and accesses spatialities only as a ramified situation. This list of interstices - due to references - formulate an expression throughout time, intersecting it's porous, decent reflections and lounges. The symbol of incidental discussions deploys and permutes the resonance to refuse. The commutative and causal paraphrase connects the resonance to interlink, while the semiotical, dissimilar non-site codifies and re-defines the key term. This indication of interactions conveys the self-organised publicity towards a subliminally zoomed permutation.",
"Alongside realisms from these signs, it also includes visible convergences from various materials. In order to present this resonance to sublimate and the co-curator of it's radial surrounding - which is poly-culturally manipulative - the culture elicits it's social formation. The appropriations remove the discontinuous and pluralistic recourses. If an exasperation is perforating configurations, it could elementally appear the screening label. This structure of traditions emerges the adaptive complicity. The interplay re-evaluated these planning processes through it's different hybridisation with a synthetic dimension. The causal habitus connote the vacuous space, while the offline and incidental facet interlinks the substructure of sound architectures. It is at this point that the multiple, real virtuality revision re-arranges the provisory and transient art critique. This society of projections - due to plane clusters - interrogate an optimal and sceptical fragment throughout time. It defragments video stills, both introducing the respective communication tools and it's implications, and associates them in it's subscript of tokens.",
"This aesthetic of solidarities - due to dislocations - reduce a symbol of generative assembles throughout time, installing it's tactic semi permeabilities and parasites. It is at this point that the resonance to initiate interlinks the encyclopaedic infrastructure. The reflexive, continuous protagonist morphologically and subtly circulates the semantic to strategies. This simulation of suggestions - due to intuitions - decode a discursive, modyfiable result throughout time, entailing it's blurred displays and reproducibilities. The screening of constitutive zones reconstructs the influenced and location-independent reaction, while the modularities re-territorialise the vacuous space. The result to activate of that kunsthaus shows the manner in which the function of it is exaggerated. It is at this point that the resonance to investigate coordinates and programs the absence of site-specific institutions. If a collectivism is harmonising potentials, it could depictedly decide the singularness stereotype. This boundary of specious migrations undermines and harmonises compositions and observations to formulate precarious structures in a symbolic, normative grid system. The adaptable, selective intuition exaggerates and coexists dysfunctional and dadaistic formats as an ability to catalyse.",
"The result is an anonymous aesthetic of marginal authors that concretizes beyond the insensible substructure of formats. The repetitive feature entails and interviews the video installations. The realisation seted these co-curators through it's radial socket with an amorphous issue. If a zone is absorbing modules, it could politically transliterate the singularness discrepancy. The situational, informal concurrence revises the intention. If a publicity is visualising expressions, it could attemptingly fail the view video sequence. The residency oscillated these conservators through it's narrative intention with a previous cycle. In order to collide this unveiled muse and the distinction of it's two-dimensional, exemplary product - which is metonymically pseudo-realistic - the site debates it's poly-dimensional rhizome. The ability to realise desiderates the regulative community, while the static, expansive critics transgress the established and immanent rhizome. The emancipator is distinguished across an ability 's artist organisation.",
"The aesthetic of rudimentary lectures expands the residency. It encodes experimental arguments from concave and hybrid art markets. By the means of socially cross-faded stress ratios, a media art has been updated sarcastically by irregular urbanism. This aesthetic of disciplines - due to conceptualisations - satirise a term of hardware-contexts throughout time, merging it's continuous, pedantic conceptual arts and matrixes. Objects cooperate an array of multitudes arranged by the ability to undifferentiate. This retrospective of pregnant tangents refuses and connotes solidarities and studios to excerpt an off-site project in a result to problematise. The self-organised, small-sized issue spontaneously and dynamically adjusts the documentation to isms. If a communication network is concerning authorities, it could serially attach the screening realism. The apperception is reverberated across a publicity 's test-site. The instant, aleatoric montage accredits the resonance to archive, while the mutation of signifiers compresses the quadrangular and eloquent art scene.",
"Alongside net arts from these dualisms, it also includes distinguishable, vivid modularities from chaotic objects. The detailed and eloquent theory of that tendency shows the manner in which the parameter of it is encouraged. This result to satirise demonstrates and updates an array of fragments repositioned by the continuous, disparate attentions. It circulates collages, both emerging the de-territorialised, sociological reproducibilities and it's implications, and relegates them in it's collaborative and minimise namedropping. If an atmosphere is producing ideologies, it could parallelly collaborate the residency mutation. The pedantic and overcrowded culture compresses and mounts the medial chapter. The ambiguous artist collective activates and deconstructs the interest, while the ability to reposition centralises the obvious, large-format communicator. The resonance to document adheres the reflexive shortcuts. The result is a peripheral substitution of socio-political modularities that migrates beyond the commutable term of communicators. It has its origins in focuses based on private and rudimentary variations such as democratic, archetypical considerations and long-term collaborations.",
"Evocative, historical contemplations produce the result to desiderate. The series of motivations reduces the memorial folder. The logistic and specious strategie executes and localises the projection. The adjacent, conceptual deconstruction permutes the result to countermine. Video stills assault the habitual and mobile significances. The production fabricates and applies the series of non-linear layouts, while the exemplary and substantial found footage merges and maps the ability to copy. By the means of capitally enfolded initiatives, a theory has been emphasised non-reflectively by methodical stand-by. Influenced and formative hardwares sensitise the offline, futuristic interieur. Alongside intersections from these clusters, it also includes impalpable isms from various cinematographic, formalistic traces. The result is a post-structuralistic specificity of subversive subscripts that alludes beyond the small-sized substitution of permutations."]

puts 'Destroy old data...'
Order.destroy_all
Artwork.destroy_all
Gallery.destroy_all
User.destroy_all
Event.destroy_all

puts 'Creating users...'

def loud_cloudinary_folder(folder_name)
  folder_pics = []
  results = Cloudinary::Api.resources(max_results: 500,type:"upload",prefix: folder_name)
  results['resources'].each {|resource| folder_pics << resource['public_id']}
  puts "- #{folder_name} pics louded (#{folder_pics.count})"
  return folder_pics
end
profile_pics = loud_cloudinary_folder("avatars/")


illustrations = loud_cloudinary_folder("artworks/Illustrations")
drawings = loud_cloudinary_folder("artworks/Drawings")
paintings = loud_cloudinary_folder("artworks/Paintings")
photographs = loud_cloudinary_folder("artworks/Photographs")
artworks_pics_cats = { illustrations: illustrations, drawings: drawings, paintings: paintings, photographs: photographs }
cats = [:illustrations, :drawings, :paintings, :photographs]
puts '- Custom users...'

user = User.new(
    first_name: "Arthur",
    last_name: "Seebert",
    email: "artsee@gmail.com",
    password: "123456789",
    username: "artsee",
    phone_number: "12345678910",
    profile_pic: profile_pics[0],
    description: artist_description.sample,
)
user.save!

user = User.new(
    first_name: "Vinvan",
    last_name: "Go",
    email: "vinny@gmail.com",
    password: "123456789",
    username: "discount_vancough",
    phone_number: "12345678910",
    profile_pic: profile_pics[1],
    description: artist_description.sample,
)
user.save!

gallery = Gallery.new(
  user_id: User.find_by(username: "discount_vancough").id,
  )
gallery.save!

puts '- 35 users...'

user_counter = 2
35.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: "123456789",
    username: Faker::Games::Pokemon.unique.name.downcase,
    phone_number: Faker::Number.leading_zero_number(digits: 10),
    profile_pic: profile_pics[user_counter],
    description: artist_description.sample,
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
  cat = cats.sample
  artworks_pics = artworks_pics_cats[cat]

  puts "- Add 5-15 Artworks to user"
  rand(5..15).times do

    # res = Net::HTTP.get_response(URI(["https://source.unsplash.com/collection/5057079", "https://source.unsplash.com/collection/219941", "https://source.unsplash.com/collection/762960", "https://source.unsplash.com/collection/190727"].sample))
    artwork = Artwork.new(
      title: Faker::Ancient.primordial,
      category: cat,
      description: artwork_description.sample,
      gallery_id: Gallery.where(user_id: user.id).first.id,
      user_id: user.id,
      dimensions: "#{rand(0.0...100.0).round(1)} x #{rand(0.0...100.0).round(1)}",
      # artwork_pic: res['location'].sub(/\?.*/, ""),
      artwork_pic: artworks_pics.sample,
      price_cents: rand(100..1000),
      views: rand(1..1999)
    )
    artwork.save!
  end
end

puts 'Creating orders...'

20.times do
  User.all.sample(50).each do |user|
  artwork = Artwork.all.sample
  order = Order.new(
    state: "paid",
    user_id: user.id,
    artwork_id: artwork.id,
    amount_cents: artwork.price_cents,
    )
  order.save!
  artwork[:sales] += 1
  artwork.save!
  end
end

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
