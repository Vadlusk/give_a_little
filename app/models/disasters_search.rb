class DisastersSearch
  def initialize(limit)
    @limit = limit
  end

  def disasters
    raw_disasters.map { |raw_disaster| Disaster.new(raw_disaster) }
  end

  private

    def raw_disasters
      ReliefWebService.new('', @limit).json_disasters
    end
end
