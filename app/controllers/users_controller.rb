class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id # When a new user is created, their ID will automatically be added to the session object user_id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

private
	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation)
	end

end
