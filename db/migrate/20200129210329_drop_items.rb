class DropItems < ActiveRecord::Migration[6.0]

  def up
    drop_table :items
   end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
