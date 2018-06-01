class DonationsController < ApplicationController
  def new
    if params['charity'].nil?
      flash[:error] = 'Please select a charity.'
    elsif current_user.nil?
      flash[:error] = 'Please login or create an account before donating.'
    elsif params['charity'] && current_user
      @donation = Donation.new
    end
  end
end
