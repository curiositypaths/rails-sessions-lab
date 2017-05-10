class SessionsController < ApplicationController
  skip_before_action :check_if_user_is_logged_in, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if user_and_password_are_valid?
      session[:user_id] = @user.id
      redirect_to private_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_and_password_are_valid?
    @user && @user.authenticate(params[:password])
  end
end
