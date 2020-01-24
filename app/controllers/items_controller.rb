class ItemsController < ApplicationController
	before_action :find_item, only: [:show]
	#skip_before_action :authorized

    def index
      @items = Item.all
      render json: @items
    end

    def show
      render json: @item
    end

    private
    def item_params
      params.permit(:name, :description, :restaurant_id, :image_url)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end