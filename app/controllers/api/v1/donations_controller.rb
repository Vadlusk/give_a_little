class Api::V1::DonationsController < ApplicationController
  def create
    json_request_body = JSON.parse(request.body.string, symbolize_names: true)
    @donation = DonationPost.new(json_request_body).donation
    head :ok, status: :created
  end
end
