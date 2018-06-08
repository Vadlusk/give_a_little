class DonationsController < ApplicationController
  def new
    if params['charity'].nil?
      flash_error('Please select a charity.')
    elsif current_user.nil?
      flash_error('Please login or create an account before donating.')
    end
  end
end
