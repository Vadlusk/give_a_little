class DonationPost
  def initialize(data)
    @data = data
  end

  def donation
    @donation = Donation.from_data(json_donation)
  end

  private

    def json_donation
      PandaPayService.new(@data).json
    end
end
