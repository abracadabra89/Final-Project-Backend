class Search < ApplicationRecord
	has_many :restaurants
	belongs_to :user
end