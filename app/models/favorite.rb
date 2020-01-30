class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :place, :class_name => "Business"
	validates_uniqueness_of :user_id, :scope => :place_id
end