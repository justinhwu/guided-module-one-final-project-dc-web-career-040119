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


jacks_a = RestaurantCuisines.find_or_create_by(restaurant_id: jacks.id, cuisine_id: american.id)
jacks_c = RestaurantCuisines.find_or_create_by(restaurant_id: jacks.id, cuisine_id: chinese.id)
chipotle_m = RestaurantCuisines.find_or_create_by(restaurant_id: chipotle.id, cuisine_id: mexican.id)
blues_m = RestaurantCuisines.find_or_create_by(restaurant_id: blues.id, cuisine_id: mexican.id)
pf_changs_c = RestaurantCuisines.find_or_create_by(restaurant_id: pf_chang.id, cuisine_id: chinese.id)
pf_changs_a = RestaurantCuisines.find_or_create_by(restaurant_id: pf_chang.id, cuisine_id: american.id)
amys_i =RestaurantCuisines.find_or_create_by(restaurant_id: amys.id, cuisine_id: italian.id)
mellow_i = RestaurantCuisines.find_or_create_by(restaurant_id: mellow.id, cuisine_id: italian.id)
serow_t = RestaurantCuisines.find_or_create_by(restaurant_id: serow.id, cuisine_id: thai.id)
cheesecake_a = RestaurantCuisines.find_or_create_by(restaurant_id: cheesecake.id, cuisine_id: american.id)
cheesecake_i = RestaurantCuisines.find_or_create_by(restaurant_id: cheesecake.id, cuisine_id: italian.id)
takorean_k = RestaurantCuisines.find_or_create_by(restaurant_id: takorean.id, cuisine_id: korean.id)
takorean_m = RestaurantCuisines.find_or_create_by(restaurant_id: takorean.id, cuisine_id: mexican.id)
bul_k= RestaurantCuisines.find_or_create_by(restaurant_id: bul.id, cuisine_id: korean.id)
