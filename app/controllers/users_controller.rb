class UsersController < ApplicationController

	def index 
		render json: User.all
	end

	def show 
		render json: @user
	end

	def create
		@user = User.create(user_params)
		if @user
		  render json: @user
		else
		  render json: { errors: @user.errors.full_messages }
		end
	end
	
	def update
		if @user
		@user.update(password: params[:password])
			render json: { msg: "You updated your password!" }
		else
			render json: { msg: "Sorry, try again" }
		end
	end
	
	def delete
	end
	
	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
	
	def set_user
		@user = User.find(params[:id])
		end
	end


