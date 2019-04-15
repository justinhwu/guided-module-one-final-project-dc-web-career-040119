Neighborhood.destroy_all
Cuisine.destroy_all
Restaurant.destroy_all

american = Cuisine.find_or_create_by(name: "American")

gallery_pl = Neighborhood.find_or_create_by(name: "Gallery Place")

jacks = Restaurant.find_or_create_by(name: "Jack's Fresh", price: "$", family_friendly: true, cuisine_id: american.id, neighborhood_id: gallery_pl.id)
