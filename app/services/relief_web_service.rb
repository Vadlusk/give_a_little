class ReliefWebService

  def initialize(id=nil)
    @id   = id
    @conn = Faraday.new('https://api.reliefweb.int')
  end

  def json_disaster
    JSON.parse(response("/v1/disasters/#{@id}").body)['data'][0]
  end

  def json_disasters
    JSON.parse(response('/v1/disasters').body)['data']
  end

  private
    attr_reader :conn

    def params
      { appname: 'givealittle',
        profile: 'list',
        preset: 'latest',
        fields: {
          include: %w[primary_country primary_type description-html],
          exclude: %w[country]
        } }
    end

    def response(uri)
      @response ||= conn.get(uri) do |req|
        req.params = params
      end
    end
end
