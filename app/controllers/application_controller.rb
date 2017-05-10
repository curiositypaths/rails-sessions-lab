class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_if_user_is_logged_in

  helper_method :logged_in_and_valid_user?

  private
  def check_if_user_is_logged_in
    redirect_to login_path unless logged_in_and_valid_user?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in_and_valid_user?
    !!current_user
  end
end
