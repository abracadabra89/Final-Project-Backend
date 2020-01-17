class User < ApplicationRecord
	has_secure_password
	has_many :searches
	has_many :cart_items
	has_many :items, through: :cart_items
	has_many :favorites
	has_many :places, through: :favorites
	has_many :restaurants, through: :searches
end