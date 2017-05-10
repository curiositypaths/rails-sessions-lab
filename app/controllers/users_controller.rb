class UsersController < ApplicationController
  skip_before_action :check_if_user_is_logged_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? redirect_to(private_path) : render(:new)
  end

  private
  def user_params
    params.require(:user).permit(:name,:password)
  end
end
