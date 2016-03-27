class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :current_user
  helper_method :authorize_access
  helper_method :build_custom_id


  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize_access(object)
    halt 403 unless current_user == object.user.id
  end

  def logged_in?
    !!current_user
  end

  def build_custom_id(object, direction)
    id = "#{object.class}-" + "#{object.id}-" + direction + "vote-link"
  end
end
