class PandaPayService
  def initialize(data)
    @data = data
    @conn = Faraday.new('https://api.pandapay.io')
  end

  def json_receipt
    JSON.parse(response('/v1/donations').body, symbolize_names: true)
  end

  private

    def response(uri)
      @response ||= @conn.post(uri) do |req|
        req.params  = params
        req.headers['Authorization'] = "Basic #{Base64.encode64(ENV['pandapay_test_secret_key'])}"
      end
    end

    def params
      { source: @data[:source],
        amount: @data[:amount],
        destination: @data[:destination],
        receipt_email: @data[:email],
        currency: 'usd',
        charge_amount: @data[:amount] }
    end
end
