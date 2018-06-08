class ApplicationController < ActionController::Base
  helper_method :current_user
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def flash_error(message)
    flash[:danger] = message
    redirect_back(fallback_location: disasters_path)
  end

  def set_session_user(message)
    session[:user_id] = @user.id
    flash[:success] = message
    redirect_to dashboard_path
  end
end
