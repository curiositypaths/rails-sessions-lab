class SessionsController < ApplicationController
  skip_before_action :check_if_user_is_logged_in, except: [:destroy]

  def new
  end

  def create
    if valid_user?
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
  def valid_user?
    @user = User.find_by(name: params[:name])
    @user && @user.authenticate(params[:password])
  end
end
