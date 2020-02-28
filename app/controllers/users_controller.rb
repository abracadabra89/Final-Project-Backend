class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
     @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @user.save!
    if @user
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
    {email: params[:email], password: params[:password]}
  end
end