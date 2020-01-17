class CartItemsSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :item_id, :quantity, :name, :price
end