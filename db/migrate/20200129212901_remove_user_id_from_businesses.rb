class RemoveUserIdFromBusinesses < ActiveRecord::Migration[6.0]
  
  def change
    remove_column :businesses, :business_id, :string
  end
  
end
