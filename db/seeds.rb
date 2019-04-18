Neighborhood.destroy_all
Cuisine.destroy_all
Restaurant.destroy_all

american = Cuisine.find_or_create_by(name: "American")
chinese = Cuisine.find_or_create_by(name: "Chinese")
mexican = Cuisine.find_or_create_by(name: "Mexican")
italian = Cuisine.find_or_create_by(name: "Italian")
thai = Cuisine.find_or_create_by(name: "Thai")
korean = Cuisine.find_or_create_by(name: "Korean")


gallery_pl = Neighborhood.find_or_create_by(name: "Gallery Place")
dupont = Neighborhood.find_or_create_by(name: "Dupont Circle")
metro_center = Neighborhood.find_or_create_by(name: "Metro Center")
clarendon = Neighborhood.find_or_create_by(name: "Clarendon")
adams_morgan = Neighborhood.find_or_create_by(name: "Adams Morgan")
cleveland_park = Neighborhood.find_or_create_by(name: "Cleveland Park")


jacks = Restaurant.find_or_create_by(name: "Jack's Fresh", price: "$", family_friendly: true, neighborhood_id: gallery_pl.id)
chipotle = Restaurant.find_or_create_by(name: "Chipotle", price: "$", family_friendly: false, neighborhood_id: dupont.id)
pf_chang = Restaurant.find_or_create_by(name: "PF Chang's", price: "$$", family_friendly: true, neighborhood_id: metro_center.id)
blues = Restaurant.find_or_create_by(name: "Mexicali Blues", price: "$$", family_friendly: true, neighborhood_id: clarendon.id)
amys = Restaurant.find_or_create_by(name: "2 Amy's", price: "$$", family_friendly: true, neighborhood_id: cleveland_park.id)
mellow = Restaurant.find_or_create_by(name: "Mellow Mushroom", price: "$$", family_friendly: true, neighborhood_id: adams_morgan.id)
serow = Restaurant.find_or_create_by(name: "Little Serow", price: "$$$$", family_friendly: false, neighborhood_id: dupont.id)
cheesecake = Restaurant.find_or_create_by(name: "Cheesecake Factory", price: "$$$", family_friendly: true, neighborhood_id: clarendon.id)
takorean = Restaurant.find_or_create_by(name: "Takorean", price: "$", family_friendly: true, neighborhood_id: metro_center.id)
bul = Restaurant.find_or_create_by(name: "BUL", price: "$$$", family_friendly: true, neighborhood_id: adams_morgan.id)
panda_express = Restaurant.find_or_create_by(name: "Panda Express", price: "$", family_friendly: true, neighborhood_id: metro_center.id)


jacks_a = RestaurantCuisine.find_or_create_by(restaurant_id: jacks.id, cuisine_id: american.id)
jacks_c = RestaurantCuisine.find_or_create_by(restaurant_id: jacks.id, cuisine_id: chinese.id)
chipotle_m = RestaurantCuisine.find_or_create_by(restaurant_id: chipotle.id, cuisine_id: mexican.id)
blues_m = RestaurantCuisine.find_or_create_by(restaurant_id: blues.id, cuisine_id: mexican.id)
pf_changs_c = RestaurantCuisine.find_or_create_by(restaurant_id: pf_chang.id, cuisine_id: chinese.id)
pf_changs_a = RestaurantCuisine.find_or_create_by(restaurant_id: pf_chang.id, cuisine_id: american.id)
amys_i =RestaurantCuisine.find_or_create_by(restaurant_id: amys.id, cuisine_id: italian.id)
mellow_i = RestaurantCuisine.find_or_create_by(restaurant_id: mellow.id, cuisine_id: italian.id)
serow_t = RestaurantCuisine.find_or_create_by(restaurant_id: serow.id, cuisine_id: thai.id)
cheesecake_a = RestaurantCuisine.find_or_create_by(restaurant_id: cheesecake.id, cuisine_id: american.id)
cheesecake_i = RestaurantCuisine.find_or_create_by(restaurant_id: cheesecake.id, cuisine_id: italian.id)
takorean_k = RestaurantCuisine.find_or_create_by(restaurant_id: takorean.id, cuisine_id: korean.id)
takorean_m = RestaurantCuisine.find_or_create_by(restaurant_id: takorean.id, cuisine_id: mexican.id)
bul_k= RestaurantCuisine.find_or_create_by(restaurant_id: bul.id, cuisine_id: korean.id)
panda_a = RestaurantCuisine.find_or_create_by(restaurant_id: panda_express.id, cuisine_id: american.id)
panda_c = RestaurantCuisine.find_or_create_by(restaurant_id: panda_express.id, cuisine_id: chinese.id)
