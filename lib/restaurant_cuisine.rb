class RestaurantCuisines< ActiveRecord::Base
  belongs_to :restaurants
  belongs_to :cuisines
end
