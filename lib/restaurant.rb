class Restaurant < ActiveRecord::Base
  has_one :neighborhoods
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines
end
