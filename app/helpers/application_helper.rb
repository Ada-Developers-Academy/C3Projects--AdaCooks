module ApplicationHelper

  def current_user?
    self.id = session[:user_id]
  end

end
