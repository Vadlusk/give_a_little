class CharitiesService
  def initialize(disaster_type)
    @disaster_type = disaster_type
    @conn = Faraday.new('https://api.data.charitynavigator.org')
  end

  def json_charities
    JSON.parse(response('/v2/Organizations').body, symbolize_names: true)
  end

  private

    def params
      { app_id: ENV['charity_nav_app_id'],
        app_key: ENV['charity_nav_api_key'],
        pageSize: 15,
        search: @disaster_type,
        sort: ('relevance:desc' if @disaster_type),
        rated: true }.delete_if{ |k,v| v.nil? }
    end

    def response(uri)
      @response ||= @conn.get(uri) do |req|
        req.params = params
      end
    end
end
