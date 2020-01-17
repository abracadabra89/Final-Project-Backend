class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :place, :class_name => ‘Restaurant’
end