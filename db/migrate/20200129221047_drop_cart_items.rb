class DropCartItems < ActiveRecord::Migration[6.0]
  def up
    drop_table :cart_items
   end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
