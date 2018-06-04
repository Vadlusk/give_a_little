class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil? && request.env['omniauth.auth']
      @user = User.from_omniauth(request.env['omniauth.auth'])
      @user.password = 'ChangeThis'
      @user.save!
      session[:user_id] = @user.id
      redirect_to dashboard_path
    elsif @user.nil?
      flash[:danger] = 'Email not found. Please create an account or try again.'
      redirect_to login_path
    elsif @user && @user.authenticate(params[:password]) == false
      flash[:danger] = 'Incorrect password. Please try again.'
      redirect_to login_path
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to disasters_path
  end
end
