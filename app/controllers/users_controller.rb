class UsersController < ApplicationController
	def index
		@user = User.all 
		render :index
	end

	def new
		@user = User.new
		render :new
	end

	def create 
		user_params = param.require(:user).permit(:first_name, :last_name, :email, :password)
		@user = User.create(user_params)
		login(@user) #logs in the user
		redirect_to "/users/#{@user.id}"  #goes to show page
	end 

	def show
		@user = User.find(params[:id])
		render :show
	end
end
