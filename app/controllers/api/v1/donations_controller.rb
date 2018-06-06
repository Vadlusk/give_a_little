class Api::V1::DonationsController < ApplicationController
  def create
    DonationPost.new(json_params)
    render nothing: true, status: 201
  end

  private

    def json_params
      params.permit(:source, :amount, :destination, :email)
    end
end
