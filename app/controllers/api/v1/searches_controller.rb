class SearchesController < ApplicationController
	
	def index
		render json: Search.all
	  end
	
	  def show
		@search = Search.find(params[:id])
		render json: @search.restaurants
	  end

	def create
		if logged_in
			user = current
			@search = Search.create(term: params[:term], user: user)
			if @search
				render json: @search.businesses
			else
				render json: { errors: @search.errors.full_messages }
			end
		else
			render json: { errors: "You are not logged in" }
		end
	end	
end