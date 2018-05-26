class DisastersService

  def disasters
    raw_disasters.map do |raw_disaster|
      Disaster.new(raw_disaster)
    end
  end

  private
    def conn
      Faraday.new("https://api.reliefweb.int/v1/disasters?appname=apidoc&profile=list&preset=latest&fields[include][]=primary_country&fields[include][]=primary_type&fields[include][]=description&primary_type&fields[exclude][]=country")
    end

    def response
      @response ||= conn.get
    end

    def raw_disasters
      JSON.parse(response.body, symbolize_names: true)[:data]
    end
end
