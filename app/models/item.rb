class Item < ApplicationRecord
	belongs_to :restaurant 
	has_many :cart_items
	has_many :users, through: :cart_items

end