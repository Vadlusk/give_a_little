class DonationsController < ApplicationController
  def new
    if params['charity'].nil?
      flash[:error] = 'Please select a charity.'
    elsif current_user.nil?
      flash[:error] = 'Please login or create an account before donating.'
    end
    redirect_to charities_path
  end
end
