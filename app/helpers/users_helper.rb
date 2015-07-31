module UsersHelper
  def authenticated?
    session[:user_id] == @user.id
  end
end
