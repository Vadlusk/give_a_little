class CharitiesService
  def initialize(disaster_type)
    @disaster_type = disaster_type
  end

  def charities
    raw_charities.map do |raw_charity|
      Charity.new(raw_charity)
    end
  end

  private

  def conn
    Faraday.new("https://api.data.charitynavigator.org/v2/Organizations?app_id=#{ENV['charity_nav_app_id']}&app_key=#{ENV['charity_nav_api_key']}&pageSize=15&sort=rating%3Adesc")
  end

  def response
    @response ||= conn.get
  end

  def raw_charities
    JSON.parse(response.body, symbolize_names: true)
  end
end
