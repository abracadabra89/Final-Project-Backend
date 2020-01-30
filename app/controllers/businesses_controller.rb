class BusinessesController < ApplicationController

	def index
		@businesses = Business.all
		render json: @businesses
	end

	def show
		@business = Business.find(params[:id])
		render json: @business
	end
	
end