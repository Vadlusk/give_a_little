class DonationsController < ApplicationController
  def new
    @charity = params['charity']
    if @charity.nil?
      flash_error('Please select a charity.')
    elsif current_user.nil?
      flash_error('Please login or create an account before donating.')
    end
  end
end
