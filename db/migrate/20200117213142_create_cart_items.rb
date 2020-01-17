class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :quantity
      t.string :name
      t.float :price
      
    end
  end
end
