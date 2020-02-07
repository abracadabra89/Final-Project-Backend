class AddIdToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :business_id, :string
  end
end
