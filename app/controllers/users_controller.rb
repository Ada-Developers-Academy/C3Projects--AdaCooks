class UsersController < ApplicationController
	def index; end

	def new
		# guard against logged in users from registering
		@user = User.new
	end

	def create
		@user = User.new(create_params)

		if @user.save
			session[:user_id] = @user.id  # now logged in
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	private

	def create_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
