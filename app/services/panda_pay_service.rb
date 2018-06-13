class PandaPayService
  def initialize(data)
    @data = data
    @conn = Faraday.new("https://#{ENV['pandapay_test_secret_key']}:@api.pandapay.io")
  end

  def json_receipt
    JSON.parse(response('/v1/donations').body, symbolize_names: true)
  end

  private

    def params
      { source: @data[:source],
        amount: @data[:amount],
        destination: @data[:destination],
        receipt_email: @data[:email],
        currency: 'usd' }
    end

    def response(uri)
      @response ||= @conn.post(uri) do |req|
        req.params = params
      end
    end
end
