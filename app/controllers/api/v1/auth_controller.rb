class Api::V1::AuthController < ApplicationController
  

   def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encoded_token(user)
      render json: {user: user, jwt: token}, status: 200
    else
      render json: {error: 'Invalid credentials'}, status: 401
    end
  end

  def show
    if logged_in
      render json: {email: current_person.email, id: current_person.id, favorites: current_person.places}, status: 200
    else
      render json: {error: 'Token Invalid'}, status: 401
    end
  end

end