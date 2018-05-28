class DonationsController < ApplicationController
  def new
    if params['charity'].nil?
      flash[:error] = 'Please select a charity.'
      redirect_to charities_path
    elsif current_user.nil?
      flash[:error] = 'Please login or create account before donating.'
    end
  end
end
