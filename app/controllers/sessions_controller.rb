class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login!(@user)
      render js: "window.location = '/'"
    else
      render json: { error: ["Invalid email and/or password"] }, status: 422
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
