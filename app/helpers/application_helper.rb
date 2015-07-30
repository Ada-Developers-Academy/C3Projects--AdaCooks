module ApplicationHelper
  ALPHABET = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  # log-in a newly created user
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
   current_user != nil
  end

end
