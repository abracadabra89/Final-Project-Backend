class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :restaurant_id
      t.string :image_url

      t.timestamps
    end
  end
end
