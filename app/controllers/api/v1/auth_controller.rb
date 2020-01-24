class Api::V1::AuthController < ApplicationController
	#skip_before_action :authorized, only: [:create]

	 

  def create
    @user = User.find_by(email: user_params[:email])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(password: user_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end


  def show
    if logged_in
      render json: {email: current_user.email, id: current_user.id, favorites: current_user.places}, status: 200
    else
      render json: {error: 'Token Invalid'}, status: 401
    end
  end

private

  def user_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:email, :password)
  end
end