module CookbooksHelper
  def authenticated?
    session[:user_id] == @cookbook.user_id
  end
end
