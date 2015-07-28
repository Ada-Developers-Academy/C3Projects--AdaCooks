class SessionsController < ApplicationController

	def create # logging in
		if identify_user && authenticate
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		end
	end

	private

	def identify_user
		if User.find_by(username: params[:session][:username])
			@user = User.find_by(username: params[:session][:username])
			return true
		else
			redirect_to new_user_path
			flash[:notice] = "We couldn't find an account with that username.\nWhy not create a new account?"
			return # exits the action
		end
	end

	def authenticate
		if @user && @user.authenticate(params[:session][:password])
			return true
		else
			redirect_to sessions_path
			flash[:error] = "Sorry, your username or password did not match our records."
			return # exists the action
		end
	end
end
