class CharitiesSearch
  def initialize(disaster_type = nil)
    @disaster_type = disaster_type
  end

  def charities
    raw_charities.map { |raw_charity| Charity.new(raw_charity) }
  end

  private

    def raw_charities
      CharitiesService.new(@disaster_type).json_charities
    end
end
