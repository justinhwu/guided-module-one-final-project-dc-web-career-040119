class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
    t.string :name
    t.string :price
    t.boolean :family_friendly
    t.integer :neighborhood_id
    end
  end
end
