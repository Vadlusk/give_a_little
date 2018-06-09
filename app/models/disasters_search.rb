class DisastersSearch
  def disasters
    raw_disasters.map { |raw_disaster| Disaster.new(raw_disaster) }
  end

  private

    def raw_disasters
      ReliefWebService.new.json_disasters
    end
end
