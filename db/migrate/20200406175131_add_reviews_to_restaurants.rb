class AddReviewsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :reviews, :integer
    add_column :businesses, :deliver, :boolean
    add_column :businesses, :closed, :boolean
    add_column :businesses, :price, :string
    add_column :businesses, :url, :string
  end
end
