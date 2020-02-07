class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    render json: User.all
  end

  def show
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

  def update
    if @user
      @user.update(password: params[:password])
      render json: { msg: "Password Updated!" }
    else
      render json: { msg: "There was an Error" }
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
    {email: params[:email], password: params[:password]}
  end

  def set_user
    @user = User.find(params[:id])
  end
end