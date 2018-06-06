class CharitiesService
  def initialize(disaster_type)
    @disaster_type = disaster_type
    @conn = Faraday.new('https://api.data.charitynavigator.org/v2/Organizations')
  end

  def json_charities
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def params
    { app_id: ENV['charity_nav_app_id'],
      app_key: ENV['charity_nav_api_key'],
      pageSize: 15,
      search: @type,
      rated: true }
  end

  def response
    @response ||= @conn.get do |req|
      req.params = params
    end
  end
end
