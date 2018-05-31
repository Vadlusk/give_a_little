class SessionsController < ApplicationController
  def new; end

  def create
    binding.pry
  end

  def destroy
    session[:user_id] = nil
    redirect_to disasters_path
  end
end
