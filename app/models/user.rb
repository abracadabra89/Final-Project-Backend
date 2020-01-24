class User < ApplicationRecord
	has_secure_password
	validates :email,  uniqueness: { case_sensitive: false }

	has_many :searches
	has_many :cart_items
	has_many :items, through: :cart_items
	has_many :favorites
	has_many :places, through: :favorites
	has_many :restaurants, through: :searches
end