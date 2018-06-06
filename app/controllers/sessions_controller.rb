class SessionsController < ApplicationController
  before_action :set_user

  def new; end

  def create
    if @user
      returning_local_user
    elsif request.env['omniauth.auth']
      omniauth
    elsif @user.nil?
      unrecognized_email
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success]   = 'Thank you for using our site.'
    redirect_to disasters_path
  end

  private

    def set_user
      @user = User.find_by(email: params[:email])
    end

    def auth
      @user.authenticate(params[:password])
    end

    def returning_local_user
      auth ? right_password : wrong_password
    end

    def right_password
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.first_name}."
      redirect_to dashboard_path
    end

    def wrong_password
      flash[:danger] = 'Incorrect password. Please try again.'
      redirect_to login_path
    end

    def email
      request.env['omniauth.auth']['info']['email']
    end

    def omniauth
      User.exists?(email: email) ? returning_twitter_user : new_twitter_user
    end

    def returning_twitter_user
      @user = User.find_by(email: email)
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.first_name}."
      redirect_to dashboard_path
    end

    def new_twitter_user
      @user = User.from_omniauth(request.env['omniauth.auth'])
      @user.save!
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.first_name}, thanks for creating an account with us."
      redirect_to dashboard_path
    end

    def unrecognized_email
      flash[:danger] = 'Email not found. Please create an account or try again.'
      redirect_to login_path
    end
end
