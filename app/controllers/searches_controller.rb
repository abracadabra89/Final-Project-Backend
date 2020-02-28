class SearchesController < ApplicationController
	
	def index
    render json: Search.all
  end

  def show
    @search = Search.find(params[:id])
    render json: @search.businesses
  end

  def create
    if logged_in
      user = current_person
      @search = Search.create(term: params[:term], user: user)
      if @search
        render json: @search.businesses
	  else
        render json: { errors: @search.errors.full_messages }
      end
    else
      render json: { errors: "Not logged in" }
    end
  end
  
end