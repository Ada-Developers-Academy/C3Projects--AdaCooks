module ApplicationHelper
  def new_or_edit_path?
  end

  def correct_user?(object)
    if session[:user_id].nil?
      return false
    elsif session[:user_id] == object.user_id
      return true
    else
      return false
    end
  end
end
