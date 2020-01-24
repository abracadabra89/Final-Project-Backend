class RestaurantsController < ApplicationController

	def index 
		render json: Restaurant.all
	end

	def show 
		@restaurant = Restaurant.find(params[:id])
		render json: @restaurant
	end
end