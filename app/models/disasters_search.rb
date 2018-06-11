class DisastersSearch
  def initialize(limit, types)
    @limit = limit
    @types  = types
  end

  def disasters
    raw_disasters.map { |raw_disaster| Disaster.new(raw_disaster) }
  end

  private

    def raw_disasters
      ReliefWebService.new('', @limit, @types).json_disasters
    end
end
