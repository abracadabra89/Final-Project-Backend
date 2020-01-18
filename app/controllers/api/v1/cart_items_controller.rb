class Api::V1::CartItemsController < ApplicationController
	before_action :find_cart_item, only: [:update, :destroy]

	def index
		@user = User.find(params[:user_id])
		@cart_items = @user.cart_items
		render json: @cart_items
	end

	def create
		@user = User.find(params[:user_id])
		@cart_item = @user.cart_items.new(cart_item_params)
		if @cart_item.save
		@cart_item.save
		render json: @cart_item, status: :accepted
		else
		render json: {errors: @cart_item.errors.full_messages}, status: :unprocessible_entity
		end
	end

	def update
		@cart_item.update(cart_item_params)
		if @cart_item.save
		render json: @cart_item, status: :accepted
		else
		render json: {errors: @cart_item.errors.full_messages}, status: :unprocessible_entity
		end
	end

	def destroy
		@cart_item.destroy
		render json: @cart_item, status: :accepted
	end

private

	def cart_item_params
		params.require(:cart_item).permit(:user_id, :item_id, :quantity, :name, :price)
	end

	def find_cart_item
		@cart_item = CartItem.find(params[:id])
	end
end