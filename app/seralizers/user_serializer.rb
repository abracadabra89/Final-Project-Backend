class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :email, :favorites, :searches
end