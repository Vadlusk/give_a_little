class DonationsController < ApplicationController
  def new
    if params['charity'].nil?
      flash[:danger] = 'Please select a charity.'
      redirect_back(fallback_location: disasters_path)
    elsif current_user.nil?
      flash[:danger] = 'Please login or create an account before donating.'
      redirect_back(fallback_location: disasters_path)
    elsif params['charity'] && current_user

    end
  end
end
