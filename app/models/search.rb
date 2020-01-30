require "json"
require "http"

API_KEY = ENV["API_KEY"]



API_HOST =  "https://api.yelp.com"
BUSINESS_PATH = "/v3/businesses/" 
SEARCH_PATH = "/v3/businesses/search"


DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 10

class Search < ApplicationRecord
	has_many :businesses
	belongs_to :user

    def search(term=DEFAULT_TERM, location=DEFAULT_LOCATION)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }

    def business(business_id)
        url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
        response = HTTP.auth("Bearer #{API_KEY}").get(url)
        response.parse
    end

    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
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