class Restaurant < ApplicationRecord
 	has_many :favorites, :foreign_key => "place_id"
	has_many :users, through: :favorites
	belongs_to :search
	has_many :items
end
