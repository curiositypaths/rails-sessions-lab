class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_if_user_is_logged_in

  helper_method :logged_in_and_valid_user?

  def check_if_user_is_logged_in
    redirect_to login_path unless logged_in_and_valid_user?
  end

  private
  def logged_in_and_valid_user?
    session[:user_id] && User.find(session[:user_id])
  end
end
