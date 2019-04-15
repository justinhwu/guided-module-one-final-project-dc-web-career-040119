class Restaurant < ActiveRecord::Base
  has_one :cuisines
  has_one :neighborhoods

end
