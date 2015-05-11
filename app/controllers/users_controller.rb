class UsersController < ApplicationController
  before_action :ensure_logged_in, :ensure_current_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      render js: "window.location = '/'"
    else
      render json: { error: @user.errors.full_messages }, status: 422
    end
  end

  def show
    @user = User.includes(:movies, :orders).find(params[:id])
  end
end
