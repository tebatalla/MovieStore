class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by_session_token(session[:session_token])
  end
  
  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def ensure_logged_in
    redirect_to new_session_url unless current_user
  end

  def ensure_current_user
    redirect_to user_url(current_user.id) if current_user != User.find(params[:id])
  end
end
