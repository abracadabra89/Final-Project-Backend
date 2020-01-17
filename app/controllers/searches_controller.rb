class SearchesController < ApplicationController
	
	def index
		render json: Search.all
	  end
	
	  def show
		@search = Search.find(params[:id])
		render json: @search.restaurants
	  end
	
end