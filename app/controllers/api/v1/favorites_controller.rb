class FavoritesController < ApplicationController

	def index
		render json: Favorite.all
	end

	def create
		if logged_in
			place = Restaurant.find(params[:restaurant_id])
			user = current
			@favorite = Favorite.create(place: place, user: user)
			if @favorite
				render json: {id: place[:id], name: place[:name]}
			else
				render json: { errors: @favorite.errors.full_messages 
			end
		else
			render json: { errors: "You are not logged in" }
		end
	end

	def delete
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
	end
end