class RenameRestaurantIdToBusinessId < ActiveRecord::Migration[6.0]
  def change
    rename_column :businesses, :restaurant_id, :business_id
  end
end
