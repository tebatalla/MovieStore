class UsersController < ApplicationController
  before_action :ensure_logged_in, :ensure_current_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to :root
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.includes(:movies).find(params[:id])
  end
end
