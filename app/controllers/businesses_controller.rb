class BusinessesController < ApplicationController

	def index
		render json: Business.all
	end

	def show
		@business = Business.find(params[:id])
		render json: @business
	end
	
end