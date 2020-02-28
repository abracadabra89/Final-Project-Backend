class BusinessesController < ApplicationController
	before_action :find_the_business, only: [:show,:destroy]

	def index
		@businesses = Business.all
		render json: @business
	end

	def show
		render json: @business
	end

	def destroy
		if @business.destroy
		render json: { message: "Successfully removed item." }, status: 204
		else
		render json: { message: "Unable to remove item" }, status: 400
		end
	end

  private 

	def find_the_business
		@business = Business.find(params[:business_id])
	end

	def business_params
		params.require(:business).permit(:business_id)
	end
	
end