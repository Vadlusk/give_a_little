class Api::V1::DonationsController < ApplicationController
  def create
    json_request_body = JSON.parse(request.body.string, symbolize_names: true)
    @donation = DonationPost.new(json_request_body).donation
    if @donation.save!
      head :ok, status: :created
    else
      flash[:danger] = 'Donation did not save.'
    end
  end
end
