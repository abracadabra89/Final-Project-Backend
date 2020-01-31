class FavoritesController < ApplicationController

  def index
    render json: Favorite.all
  end

  def create
    if logged_in
      place = Business.find(params[:business_id])
      user = current_user
      @favorite = Favorite.create(place: place, user: user)
      if @favorite
        render json: {id: place[:id], name: place[:name]}
      else
        render json: { errors: @favorite.errors.full_messages }
      end
    else
      render json: { errors: "User not logged in" }
    end
  end

  def delete
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

end