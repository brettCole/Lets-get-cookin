class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

end
