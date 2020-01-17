class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_id
      t.string :name
      t.string :image_url
      t.string :address
      t.float :latitude
      t.float :longtitude
      t.integer :search_id

      t.timestamps
    end
  end
end
