class FavoritesController < ApplicationController

  def index
    render json: Favorite.all
  end


  def create
    if logged_in
      place = Business.find(params[:business_id])
      user = current_person
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

  
  def show
    favorite = Business.find(params[:id])
    render json: favorite
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(params[:id])
    render json: {id: place[:id], name: place[:name]} 
  end


  def destroy
   @favorite = Business.find(params[:id])
   @favorite.destroy
   render body: nil, status: :no_content
  end


end
