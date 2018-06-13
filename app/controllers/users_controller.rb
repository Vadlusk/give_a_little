class UsersController < ApplicationController
  def show
    @donations = current_user.donations
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      WelcomeLocalUserMailer.welcome(@user).deliver_later
      set_session_user("Welcome #{@user.first_name}, thanks for creating an account with us.")
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save!
      flash[:success] = 'Successfully updated account.'
      redirect_to dashboard_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
