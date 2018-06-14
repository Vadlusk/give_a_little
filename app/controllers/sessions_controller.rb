class SessionsController < ApplicationController
  before_action :set_user, only: %i[create]

  def new; end

  def create
    if @user
      returning_local_user
    elsif request.env['omniauth.auth']
      omniauth_user
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
      set_session_user("Welcome back, #{@user.first_name}.")
    end

    def wrong_password
      flash_error('Incorrect password. Please try again.')
    end

    def email
      request.env['omniauth.auth']['info']['email']
    end

    def omniauth_user
      User.exists?(email: email) ? returning_oauth_user : new_oauth_user
    end

    def returning_oauth_user
      @user = User.find_by(email: email)
      if @user.authentications.where(provider: request.env['omniauth.auth'][:provider])
        set_session_user("Welcome back, #{@user.first_name}.")
      else
        auth = Authentication.from_oauth(request.env['omniauth.auth'], @user)
        if auth.save!
          set_session_user("Welcome back, #{@user.first_name}.")
        end
      end
    end

    def new_oauth_user
      @user = User.from_omniauth(request.env['omniauth.auth'])
      auth = Authentication.from_oauth(request.env['omniauth.auth'], @user)
      auth.save!
      if @user.save!
        WelcomeOauthUserMailer.welcome(@user).deliver_later
        set_session_user("Welcome #{@user.first_name}, thanks for creating an account with us.")
      end
    end

    def unrecognized_email
      flash_error('Email not found. Please create an account or try again.')
    end
end
