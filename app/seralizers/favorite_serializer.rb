class FavoriteSerializer < ActiveModel::Serializer
attributes :id, :name, :user_id, :place_id

def favorites
    arr =
    self.object.places.map do |restaurant|
      {id: restaurant.id, name: restaurant.name, lat: restaurant.latitude, long: restaurant.longitude}
    end
  end

end