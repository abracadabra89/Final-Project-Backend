class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :favorites, :searches
  has_many :favorites
  has_many :searches
  has_many :places, through: :favorites
  has_many :businesses, through: :searches

  def favorites
    arr =
    self.object.places.map do |restaurant|
      {id: restaurant.id, name: restaurant.name, lat: restaurant.latitude, long: restaurant.longitude}
    end
  end

  def searches
    self.object.searches
  end
	
end