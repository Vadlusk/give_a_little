class DisasterService

  def initialize(id)
    @id = id
  end

  def disaster
    Disaster.new(raw_disaster)
  end

  private
    def raw_disaster
      JSON.parse(response.body)['data'][0]
    end

    def conn
      Faraday.new("https://api.reliefweb.int/v1/disasters/#{@id}?appname=givealittle&profile=list&preset=latest&fields[include][]=primary_country&fields[include][]=primary_type&fields[include][]=description-html&primary_type&fields[exclude][]=country")
    end

    def response
      @response ||= conn.get
    end
end
