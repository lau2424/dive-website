# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Name of the spot
# latitude longitude
# category
# facilities
require 'open-uri'
# example of user that creates a spot
Review.destroy_all
Spot.destroy_all
User.destroy_all

user_details = {
  email: "tiagoscmatos@hotmail.com",
  password: "123456",
  first_name: "Tiago",
  last_name: "Matos",
  #photo: 'https://divemagazine.com/wp-content/uploads/shutterstock_73058680.jpg'
}
user = User.new(user_details)
user.save

# user 2
user_details_2 = {
  email: "laurent.larfa@gmail.com",
  password: "123456",
  first_name: "Laurent",
  last_name: "Larfa"
}
user_2 = User.new(user_details_2)
user_2.save

# user 3

user_details_3 = {
  email: "fhd.pestel@gmail.com",
  password: "123456",
  first_name: "Fabrice",
  last_name: "Pestel"
}
user_3 = User.new(user_details_3)
user_3.save

# user 4

user_details_4 = {
  email: "krestendesmedt@gmail.com",
  password: "123456",
  first_name: "Kresten",
  last_name: "Jensen"
}
user_4 = User.new(user_details_4)
user_4.save

# USER DETAILS CREATION OF THE ACTUAL SPOT

# spot 1
spot_details = {
  name: "SS Thistlegorm",
  latitude: 27.8137460146132,
  longitude: 33.92075717116466,
  category: "Scuba Diving",
  facility: "Boat tours to reach the site. Tours with meals included.",
  difficulty: "Advanced",
  description: "The best wreck dive in the world, the SS Thistlegorm lies in the northern section of the Red Sea.

  As a popular day trip and liveaboard stop, it’s easily accessible from Sharm El-Sheikh.
  The wreck itself was a 420-foot (128-meter) British transport ship.
  Unfortunately, she met her fate in 1941 when she was sunk by a German air attack.
  Today, she remains a window into history with a visible cargo of trucks, jeeps, motorcycles,
  tanks and even a locomotive.",
  user: user

}
spot_1 = Spot.new(spot_details)
file = URI.open('https://divemagazine.com/wp-content/uploads/shutterstock_73058680.jpg')
spot_1.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/8/8c/Thistlegorm_train_parts_minus_red_edit.jpg')
spot_1.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_1.save!

# spot 2
spot_details_2 = {
  name: "Blue Corner",
  latitude: 7.101950899675428,
  longitude: 134.24192889731958,
  category: "Scuba Diving",
  facility: "Boat needed to reach site. Tours, from Palau main island, having food and renting equipment.",
  difficulty: "Moderate",
  description: "Blue Corner is a dive for the ages.
  It consists of a reef-covered wall that runs along the side of Ngemelis Island in Palau.
  While the dive is great at any time due to the massive schools of fish,
  this dive site shows its best face when the currents are strong (think more current,
    more fish – it’s never been more apt).
    Divers use reef hooks to carefully attach to the wall and watch a number of pelagic species swim past.
    Common sights include tuna, sharks and eagle rays.
    Many Blue Corner alumni claim that they have never seen so many sharks on a single dive.",
    user: user
  }
  spot_2 = Spot.new(spot_details_2)
  file = URI.open('https://masterliveaboards.com/wp-content/uploads/2022/05/Aerial-view-of-Blue-Corner-dive-site-Palau-by-Jean-Bernard-Carillet.jpg')
  spot_2.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
  file = URI.open('https://www.ravenware.com/factand/nofic/JUNIOR2.JPG')
  spot_2.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_2.save

# spot 3
spot_details_3 = {
  name: "Manta Night Dive",
  latitude: 19.560126941809703,
  longitude: -155.96496707376184,
  category: "Snorkeling",
  facility: "Farmers market, Lounge Bar, Resorts and Hotels",
  difficulty: "Beginner",
  description: "Certainly one of the most unique night dives, the Manta Night Dive is a ballet for manta rays.
  Just off the coast of Kona is an artificially illuminated area where divers descend to the sandy observation areas.
  As the light attracts plankton, mantas arrive to take advantage of the feast.
  All the divers need to do is relax and enjoy the show while the graceful manta rays turn and spin overhead.",
  user: user
}
spot_3 = Spot.new(spot_details_3)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSphfZDfxhfEhGpZux-ZcysZ3UiY4aCvrkLvQ&usqp=CAU')
spot_3.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCdFuL1A16UWpGO4qNf3J1PM_tMWwW8dElsg&usqp=CAU')
spot_3.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_3.save

# spot 4
spot_details_4 = {
  name: "Cenote Angelita",
  latitude: 20.13760693546386,
  longitude: -87.57778441803842,
  category: "Scuba Diving",
  facility: "Accomodation, Restaurants",
  difficulty: "Advanced",
  description: "There are thousands of cenotes scattered throughout the Yucatan Peninsula of Mexico,
  and many of them could easily find a spot on this list.
  But the mystical quality of Cenote Angelita makes it hard to ignore.
  At approximately 100 feet (30 meters),
  the clear freshwater is separated from the saltwater below by a layer of hydrogen sulphate.
  The appearance of this cloudy substance is otherworldly and makes for fantastic underwater photography.",
  user: user
}
spot_4 = Spot.new(spot_details_4)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZBZmg1ZaWqbJY8g7sJGMVqyGnmQD3UJJ3vw&usqp=CAU')
spot_4.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfPgIEQneWK6l8ukI49MdZ5GZXkAIMZ1XWgQ&usqp=CAU')
spot_4.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_4.save

spot_details_5 = {
  name: "Silfra Fissure",
  latitude: 64.25689674203579,
  longitude: -21.116868402671393,
  category: "Scuba Diving & Snorkeling",
  facility: "Accomodation 5km",
  difficulty: "Beginner",
  description: "Diving between continental plates may sound risky,
  but scuba divers flock to Silfra Fissure year-round for the pleasure.
  Granted, these plates are moving so slowly, that you will never know it.
  With 300-foot (100-meter) visibility,
  exploring the space between the North American and Eurasian tectonic plates is a dream.
  Glide along with the aquatic grasses full of blues and greens before snapping a picture
   between the rock faces of the plates.",
  user: user
}
spot_5 = Spot.new(spot_details_5)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjcgfLsAE7euf4QkWBPJl-JufxD93ZKEmo5g&usqp=CAU')
spot_5.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBzUPrbt4vs2_XW0heKXylGOqCFFbmMXIBTw&usqp=CAU')
spot_5.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_5.save

spot_details_6 = {
  name: "Sardine Run",
  latitude: -30.20582475232037,
  longitude: 30.803119239304994,
  category: "Scuba Diving",
  facility: "Accomodation, Restaurant, Bar, Supermarket",
  difficulty: "Beginner",
  description: "Certainly an adventurous dive,
  the sardine run attracts pelagic-loving scuba divers to South Africa on an annual basis.
  During a few weeks from May to July, millions of sardines swim up the coast in order to reach Durban where they spawn.
  On the way, many predators wait to feast on the tiny fish.
  These larger animals include dolphins, birds, sharks and whales.
  Diving the sardine run requires patience as dive boats spend many hours on the chilly seas searching for bait balls.
  When one of these congregations is finally found, divers jump in quickly to see the feeding frenzy.",
  user: user
}
spot_6 = Spot.new(spot_details_6)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKs485RmLNgG_UUGoCC9ZEIbockuUSSINpWA&usqp=CAU')
spot_6.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReqlRjPy7H_tIlzaqePheovGv3yqleSmz5hg&usqp=CAU')
spot_6.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_6.save

spot_details_7 = {
  name: "Cape Kri",
  latitude: -0.556141417973152,
  longitude: 130.6905029261628,
  category: "Scuba Diving & Snorkeling",
  facility: "Accomodation",
  difficulty: "Moderate - Advanced",
  description: "Raja Ampat seems to be on every diver’s bucket list these days.
  There is good reason for it, and Cape Kri is one of the dive sites that put this region on the map.
  A few years ago, scientists recorded the most fish species on a single dive at this site.
  The diving conditions at Cape Kri are suitable for all levels.
  You just need to dive into the warm water and slowly glide along the healthy coral reef,
  taking in all the colourful life around you.",
  user: user
}
spot_7 = Spot.new(spot_details_7)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYds8GHlTENtOP6FiDeJ0nT06iZ0BS_BrBaA&usqp=CAU')
spot_7.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7U_dQGdSkx5-4mbU0CIHZrIV99bgYGpXmfg&usqp=CAU')
spot_7.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_7.save

spot_details_8 = {
  name: "Koh Lipe",
  latitude: 6.489452933250682,
  longitude: 99.30487531289059,
  category: "Snorkeling",
  facility: "Accomodation, Bar, Restaurant, Supermarket",
  difficulty: "beginner",
  description: "Koh Lipe is a tiny paradise island in the southernmost part of Thailand,
  not far from the Malaysian border.
  Due to its colorful and intact underwater world, it is one of the absolute hotspots for snorkeling!
  But visitors are also thrilled by the snow-white sandy beaches,
  the palm trees and the warm and turquoise sea,
  which makes this island one of the most beautiful vacation destinations in Thailand!",
  user: user
}
spot_8 = Spot.new(spot_details_8)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBbL-rmjr0FD9LIxwEiaGI8svp7d59HLwo4Q&usqp=CAU')
spot_8.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ7meKdm9yZh_sM8EuRl3riXRqq7LlVPWTqw&usqp=CAU')
spot_8.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_8.save

spot_details_9 = {
  name: "Mana Island",
  latitude: -17.672344424863915,
  longitude: 177.09859956806864,
  category: "Snorkeling",
  facility: "Accomodation, Airport",
  difficulty: "Beginner",
  description: "Great Snorkeling in a couple of different locations.
  With shallow tidal reefs, these locations had in common ease of access,
  some pretty marine life and not too deep water.
  The fact that it is so easy to snorkel off the beach in Fiji makes it perfect for families learning to snorkel!
  On Mana Island, they have a ‘safe swimming area’ which was cordoned off for people who weren’t confident swimmers.
  On both sides of the island, they had long strings of buoys floating out to good patches of coral. ",
  user: user
}
spot_9 = Spot.new(spot_details_9)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1tgDWmBLCtfljkQEM7oPgX0gFYQ5xnL6ZPg&usqp=CAU')
spot_9.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLFKFpTFxm7NaSyOKcJx7SDc1iRY-8lCOqPQ&usqp=CAU')
spot_9.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_9.save

spot_details_10 = {
  name: "Moorea",
  latitude: -17.531818677178045,
  longitude: -149.8270785761602,
  category: "Snorkeling",
  facility: "Accomodation, Restaurant, Airport, Hospital, Supermarket",
  difficulty: "Beginners",
  description: "As one of the most underrated islands found in French Polynesia,
  Moorea offers a spectacular array of family-friendly snorkeling opportunities.
  The most common way to reach Moorea is through a simple 30-minute ferry from nearby Tahiti.
  Once arriving, you will quickly realize why Moorea is a bucket list snorkeling destination for beginners.
  Moorea boasts extremely calm turquoise waters and soft white sand that welcome plenty of colorful fish
  and beautiful coral. ",
  user: user
}
spot_10 = Spot.new(spot_details_10)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSte1b0V1JH3ubqsr14zovGUUlHsUnzuYCzuA&usqp=CAU')
spot_10.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlJe8ggCbSh-KH-RDif-XTSsBhMmoJJzCn9w&usqp=CAU')
spot_10.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_10.save

spot_details_11 = {
  name: "Jardines de la Reina",
  latitude: 20.833974478268892,
  longitude: -78.91683840092857,
  category: "Scuba Diving",
  facility: "Boat Tours with Meals",
  difficulty: "Moderate to Advanced",
  description: "Jardines de la Reina can only be visited by liveaboard.
  Cuba’s Jardines de la Reina (Garden of the Queens) Marine Park
  is home to the largest and best-preserved coral reef system in the Caribbean.
  Nearly 850 sq. miles of protected waters are home to an awesome array of shark species,
  including silky, Caribbean reef, great hammerhead, lemon, nurse, and blacktip. Furthermore,
  divers are spoiled by an abundance of reef fish and over 50 species of coral and 200 species of sponge;
  an overwhelming plethora of life unlike anywhere else in the Caribbean.
  The island is also one of the few places where divers can safely get up close and personal with the American saltwater
  crocodile.",
  user: user
}
spot_11 = Spot.new(spot_details_11)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtguYOhS7beEVmXN-tMeqsCXtQKJIOw06v2w&usqp=CAU')
spot_11.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrH1H8uS5pjL5gb5jYU6Av3n1_j-m_lDiC4Q&usqp=CAU')
spot_11.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_11.save

spot_details_12 = {
  name: "Emergence du Ressel",
  latitude: 44.56216707251125,
  longitude: 1.7720069292178797,
  category: "Scuba Diving",
  facility: "Accomodation",
  difficulty: "Beginner to Advanced",
  description: "Located in the center of Quercy / Lot,
  the number one cave  diving destination in Europe (and the 3rd in the world),
  in our school you will be able to follow all types of training courses towards this fascinating world.
  The Cave To Be is the only local all year round open cave diving school and  facility in France.
  Our school is exclusively dedicated to cave diving and that is the main professional activity of our instructors.
  guided dives, explorations).
  We teach and dive according to TDI / IANTD / GUE training standards",
  user: user
}
spot_12 = Spot.new(spot_details_12)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkadie-Sn0U-qV6Cb9g8P2T71wSlY5NaUUZA&usqp=CAU')
spot_12.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_12.save

spot_details_13 = {
  name: "Darwin’s Arch",
  latitude: 1.6737701756065093,
  longitude: -91.99036612693386,
  category: "Scuba Diving",
  facility: "Boat tours",
  difficulty: "Advanced",
  description: "Accessible by boat from tours on the Galapagos Islands.
  This stone arch sits atop an underwater plateau known as the Theater,
  which serves as a viewing grounds for the hundreds and even thousands of schooling scalloped
  hammerheads and jacks that collect at this island — which, paired with Wolf,
  sits 115 miles from the next outpost of land.",
  user: user
}
spot_13 = Spot.new(spot_details_13)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2OeziwOJtHlNQQte5a6lm645quUg_nHwU5g&usqp=CAU')
spot_13.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_13.save

spot_details_14 = {
  name: "Race Rocks",
  latitude: 48.315490821262294,
  longitude: -124.069613561219,
  category: "Scuba Diving",
  facility: "Accomodation, Tours",
  difficulty: "Moderate",
  description: "Fast currents rush past this rocky inlet, but if you time it right,
   you can linger at this wall covered in strawberry anemones, white plumrose anemones and more.
   California and Steller sea lions are seen on most dives, and on occasion, killer whales are also observed.",
  user: user
}
spot_14 = Spot.new(spot_details_14)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgJlnoY767LEXifMvM1_4HKaWQ7WgWXFDeXQ&usqp=CAU')
spot_14.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_14.save

spot_details_15 = {
  name: "Ship Wreck MV Superior Producer",
  latitude: 12.10509306045822,
  longitude: -68.94417044247642,
  category: "Scuba Diving",
  facility: "Accomodation, Bar, Restaurant, Supermarket",
  difficulty: "Moderate",
  description: "The Superior Producer is Curaçao’s iconic shipwreck and it is one of the most popular dive sites in Curaçao.
  This wreck diving site is rated as one of the top 5 dive sites in the Caribbean and certainly an essential Curaçao
  experience! Dive in with us now as we explore the history of this incredible shipwreck and how the
  Superior Producer met an untimely end.
  Word of the sinking spread across Curaçao like wildfire! Scuba divers,
  freedivers and snorkelers alike arrived on the shoreline from all over the island to scavenge the wreck for its cargo.",
  user: user
}
spot_15 = Spot.new(spot_details_15)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwzPvSd_6BZFwLMWkUP8Vuntlmf4E0HSE14g&usqp=CAU')
spot_15.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_15.save

spot_details_16 = {
  name: "Banana Reef",
  latitude: 4.2341099395512645,
  longitude: 73.53384465752359,
  category: "Scuba Diving",
  facility: "Accomodation, Restaurant, Airport, Supermarket",
  difficulty: "Beginner to Advanced",
  description: "Banana Reef was the first dive site discovered in the Maldives,
  and because of its exquisite ocean life and popularity, it is now a protected marine area.
  In the depths of Banana Reef, expect to see a wall of brilliantly-colored coral as well as caves
  and overhangs teeming with schools of fish, like giant squirrelfish, oriental sweetlips and Napoleon wrasse.
  Banana Reef features an area for snorkelers above the coral wall and is perfect for all divers.",
  user: user
}
spot_16 = Spot.new(spot_details_16)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjc4kBPgWMsL2mGXg4xZ_IteuuesB6_skyJw&usqp=CAU')
spot_16.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYFw8U3Pxads3lXEeiLsv_6jx7Nbvj0y-ivw&usqp=CAU')
spot_16.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_16.save

spot_details_17 = {
  name: "Rasfari",
  latitude: 4.394744016521531,
  longitude: 73.35188481575527,
  category: "Scuba Diving",
  facility: "Accomodation",
  difficulty: "Beginner to Advanced",
  description: "Small Island accessible only by boat.
  Rasfari is a spectacular medley of marine wildlife including grey reef sharks,
  whitetip reef sharks and silvertip sharks.
  The reef also serves as a home for armies of eagle rays.
  Divers can plunge a little deeper for brilliant views of tunas,
  barracudas and an array of exotics, like fusiliers, the Napoleon wrasse,
  surgeonfish and all kinds of snappers!",
  user: user
}
spot_17 = Spot.new(spot_details_17)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4SqbsaD7Dd8fG_TEnuzfI9CJEEiqB3DsAJg&usqp=CAU')
spot_17.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_17.save

spot_details_18 = {
  name: "South Malé Atoll",
  latitude: 3.950019734301295,
  longitude: 73.4166683410952,
  category: "Scuba Diving & Snorkeling",
  facility: "Accomodation",
  difficulty: "Advanced",
  description: "Cocoa Corner provides one of the best shark shows and advanced dives in the Maldives.
  With luck, you will be greeted by scores of grey reef sharks,
  eagle rays and jackfish swimming in a breathtaking world of vivid sponges and swaying gorgonians.
  Swim with care over the ocean floor, and you might spot a leopard shark sleeping peacefully in the sand!",
  user: user
}
spot_18 = Spot.new(spot_details_18)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu9F9QBq9MgMgNiCW5-9wwSFBbXrTCgka9OA&usqp=CAU')
spot_18.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_18.save

spot_details_19 = {
  name: "Doctors Cave Reef",
  latitude: 18.48744924517681,
  longitude: -77.93111210555583,
  category: "Snorkeling",
  facility: "Accomodation, Bar, Restaurant",
  difficulty: "Moderate",
  description: "Secrets Reef & Doctor’s Cave Reef- the two best BY FAR
  Secrets Reef snorkeling daily on site-Difficult Access, no public entry, so stay on site.
  Boat trip or Taxi to Doctor’s Cave to snorkel the reef there- Easy Access– most tours go here,
  and can be accessed from the public beach.",
  user: user
}
spot_19 = Spot.new(spot_details_19)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3kPExbwN-PFKLs1rcPSvSrzufB2tBUWRWg&usqp=CAU')
spot_19.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_19.save

spot_details_20 = {
  name: "Bloody Bay",
  latitude: 18.348078987081735,
  longitude: -78.33625990786027,
  category: "Snorkeling",
  facility: "Accomodation, Bar, Restaurant, Supermarket",
  difficulty: "Beginner",
  description: "Swim out following the rocks to the point there is loads to see
  (right hand side of the beach looking out to see).
  You will see quite a few rays (stingrays, and if you are lucky eagle rays),
  puffer fish are quite common if you want to snorkel just off of the front of the beach.
  Just be aware of jet skis, that is why snorkelling around to the small beach and following the rocks out is a safe bet.",
  user: user
}
spot_20 = Spot.new(spot_details_20)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHsJFmh-1igc6kfeNvNfngxLPRgHA8nuOc-w&usqp=CAU')
spot_20.photos.attach(io: file, filename: 'spot.jpg', content_type: 'image/jpg')
spot_20.save


# the review content and reviewer Start 29/11 15h40

# Example of a user that creates a review
user_reviewer_1 = {
  email: "matthew.albertine@hotmail.com",
  password: "123456",
  first_name: "Matthew",
  last_name: "Harwood"
}
user_reviewer_1 = User.new(user_reviewer_1)
user_reviewer_1.save

#reviews content
review_content_1 = {
  content: "One of the top dives in the Red Sea and one of the greatest and most famous wreck dives in the world.
  This stunning piece of history is a must visit when diving in the Red Sea.
  It can be very busy with divers but the shear size of it is awesome and an interesting dive filled with history.",
  rating: 5,
  user: user_reviewer_1,
  spot: spot_1
}
review_1 = Review.new(review_content_1)
review_1.save


user_reviewer_2 = {
  email: "Guilhermp.p@hotmail.com",
  password: "123456",
  first_name: "Guilhermo",
  last_name: "Pascual"
}
user_reviewer_2 = User.new(user_reviewer_2)
user_reviewer_2.save

review_content_2 = {
  content: "Spectacular dive full of gray sharks, jacks, barracudas, napoleons, etc.",
  rating: 5,
  user: user_reviewer_2,
  spot: spot_2
}
review_2 = Review.new(review_content_2)
review_2.save


user_reviewer_3 = {
  email: "jess@hotmail.com",
  password: "123456",
  first_name: "Jessica",
  last_name: "S"
}
user_reviewer_3 = User.new(user_reviewer_3)
user_reviewer_3.save

review_content_3 = {
  content: "I did the manta night snorkel and had a ton of fun! (We saw 3 mantas the night I went.)",
  rating: 5,
  user: user_reviewer_3,
  spot: spot_3
}
review_3 = Review.new(review_content_3)
review_3.save


user_reviewer_4 = {
  email: "jet@hotmail.com",
  password: "123456",
  first_name: "Alistair",
  last_name: "T"
}
user_reviewer_4 = User.new(user_reviewer_4)
user_reviewer_4.save

review_content_4 = {
  content: "At times this dive seemed quite surreal.
  On descent, the water seemed quite murky at first but then it clears nicely.
  There was a clear halo cline around 8m's which is always fun to play with.
  At around 30m's you get to the bottom and it is like a scene out of Sleepy Hollow.
  The thick cloud of hydrogen sulphide with rocks and the remains of dear trees
  emerging from it give this dive quite an atmosphere. great fun",
  rating: 5,
  user: user_reviewer_4,
  spot: spot_4
}
review_4 = Review.new(review_content_4)
review_4.save


user_reviewer_5 = {
  email: "thom@hotmail.com",
  password: "123456",
  first_name: "Thomas",
  last_name: "Rindfuss"
}
user_reviewer_5 = User.new(user_reviewer_5)
user_reviewer_5.save

review_content_5 = {
  content: "There were a lot of people so it took a while to get everybody dressed
  in their gear and there was quite a line to get in the water so we were _very_ cold
  before we got in the water.
  The water is drinkable spring water and visibility is great, or it should be.
  As snorkels towards the end of the end of the snorkeling trail kick up silt,
  the visibility gets slightly less stellar.",
  rating: 4,
  user: user_reviewer_5,
  spot: spot_5
}
review_5 = Review.new(review_content_5)
review_5.save

user_reviewer_6 = {
  email: "vorismelb@hotmail.com",
  password: "123456",
  first_name: "Stephanie",
  last_name: "Voris"
}
user_reviewer_6 = User.new(user_reviewer_6)
user_reviewer_6.save

review_content_6 = {
  content: "Awesome trip! So much marine life during this time of the sardine run and an excellent operation in Pro Dive
  to make our experience wonderful!!",
  rating: 5,
  user: user_reviewer_6,
  spot: spot_6
}
review_6 = Review.new(review_content_6)
review_6.save
