class Restaurant < ApplicationRecord
	has_many :items
 	has_many :favourites, :foreign_key => ‘place_id’
	has_many :users, through: :favorites
	belongs_to :search
end
