class ApplicationController < ActionController::Base
  helper_method :current_user, :format_date

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def format_date(date)
    date.strftime('%b %e, %Y, %l:%M %p')
  end
end
