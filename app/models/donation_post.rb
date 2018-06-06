class DonationPost
  def initialize(data)
    @data = data
  end

  def donation
    @donation = Donation.new(json_donation)
  end

  private

    def json_donation
      PandaPayService.new(@data).json
    end
end
