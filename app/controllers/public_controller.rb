class PublicController < ApplicationController
  skip_before_action :check_if_user_is_logged_in

  def index
  end
end
