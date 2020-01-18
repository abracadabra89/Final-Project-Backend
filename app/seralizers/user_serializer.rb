class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :email, :favorites, :searches
	has_many :cart_items
end