class DisasterSearch
  def initialize(id)
    @id = id
  end

  def disaster
    Disaster.new(raw_disaster)
  end

  private

    def raw_disaster
      ReliefWebService.new(@id).json_disaster
    end
end
