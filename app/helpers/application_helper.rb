module ApplicationHelper
  def readable_date(datetime)
    datetime.strftime("%b %d, %Y, at %I:%M%P")
  end

  def appropriate_user(resource)
    @current_user && @current_user.id == resource.user_id
  end

  def user_or_guest
    session[:user_id] ? User.find(session[:user_id]).username : "guest"
  end
end
