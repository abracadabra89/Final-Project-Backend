class ItemSerializer < ActiveModel::Serializer
	attributes :name, :description, :restaurant_id, :image_url
end