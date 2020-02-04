require "json"
require "http"

YELP_API = ENV["API_KEY"]



API_HOST =  "https://api.yelp.com"
BUSINESS_PATH = "/v3/businesses/" 
SEARCH_PATH = "/v3/businesses/search"


DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 10

class Search < ApplicationRecord
	has_many :businesses
	belongs_to :user
    after_create :add_business

    def add_business(location=DEFAULT_LOCATION)
        url = "#{API_HOST}#{SEARCH_PATH}"
        params = {
          term: term,
          location: location,
          limit: SEARCH_LIMIT
        }
        response = HTTP.auth("Bearer #{YELP_API}").get(url, params: params)
        new_response = JSON.parse(response)
        arr = new_response["businesses"]
        arr.each do |rest|
            address = rest["location"]["display_address"].join(", ")
            coordinates = rest["coordinates"]
            search = self
            Business.create(name: rest["name"], image_url: rest["image_url"], address: address, latitude: rest["coordinates"]["latitude"], longitude: rest["coordinates"]["longitude"], search: search)
    end
  end
end