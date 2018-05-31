class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to disasters_path
  end
end
