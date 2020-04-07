class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :place_id
  belongs_to :user
  belongs_to :place, :class_name => "Business"
end