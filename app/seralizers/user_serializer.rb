class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :favorites, :searches

  # def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
  #   hash = super
  #   hash.each { |key, value| hash.delete(key) if value.nil? }
  #   hash
  # end

  def favorites
    arr =
    self.object.places.map do |restaurant|
      {name: restaurant.name, lat: restaurant.latitude, long: restaurant.longitude}
    end
  end

  def searches
    self.object.searches
  end
	
end