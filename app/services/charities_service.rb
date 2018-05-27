class CharitiesService
  def initialize(disaster_type)
    @disaster_type = disaster_type
  end

  def charities
  end

  private

  def conn
    Faraday.new("https://api.data.charitynavigator.org/v2")
  end
end
