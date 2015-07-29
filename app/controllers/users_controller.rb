class UsersController < ApplicationController
	before_action :login_required, except: [:new, :index, :create]

	def index
	end

	def new
		@user = User.new
		flash[:notice] = "You're already logged in." if session[:user_id]
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
