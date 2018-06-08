class PandaPayService
  def initialize(data)
    @data = data
    @conn = Faraday.new('https://sk_test_TqHxqQG7X3JpLnfgpCcZpQ:@api.pandapay.io/v1/donations')
  end

  def json
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def params
      { source: @data[:source],
        amount: @data[:amount],
        destination: @data[:destination],
        receipt_email: @data[:email],
        currency: 'usd' }
    end

    def response
      @response ||= @conn.post do |req|
        req.params = params
      end
    end
end
