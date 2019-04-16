Neighborhood.destroy_all
Cuisine.destroy_all
Restaurant.destroy_all

american = Cuisine.find_or_create_by(name: "American")
chinese = Cuisine.find_or_create_by(name: "Chinese")
mexican = Cuisine.find_or_create_by(name: "Mexican")

gallery_pl = Neighborhood.find_or_create_by(name: "Gallery Place")
dupont = Neighborhood.find_or_create_by(name: "Dupont Circle")
metro_center = Neighborhood.find_or_create_by(name: "Metro Center")
clarendon = Neighborhood.find_or_create_by(name: "Clarendon")

jacks = Restaurant.find_or_create_by(name: "Jack's Fresh", price: "$", family_friendly: true, cuisine_id: american.id, neighborhood_id: gallery_pl.id)
chipotle = Restaurant.find_or_create_by(name: "Chipotle", price: "$", family_friendly: false, cuisine_id: mexican.id, neighborhood_id: dupont.id)
pf_chang = Restaurant.find_or_create_by(name: "PF Chang's", price: "$$", family_friendly: true, cuisine_id: chinese.id, neighborhood_id: metro_center.id)
blues = Restaurant.find_or_create_by(name: "Mexicali Blues", price: "$$", family_friendly: true, cuisine_id: mexican.id, neighborhood_id: clarendon.id)
