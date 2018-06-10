class ReliefWebService

  def initialize(id = '', limit = nil)
    @id    = id
    @limit = limit
    @conn  = Faraday.new('https://api.reliefweb.int')
  end

  def json_disaster
    JSON.parse(response("/v1/disasters/#{@id}").body)['data'][0]
  end

  def json_disasters
    JSON.parse(response('/v1/disasters').body)['data']
  end

  private

    def params
      @id.empty? ? disasters_params : disaster_params
    end

    def response(uri)
      @response ||= @conn.get(uri) do |req|
        req.params = params
      end
    end

    def disaster_params
      { appname: 'givealittle',
        profile: 'list',
        preset: 'latest',
        fields: {
          include: %w[primary_country primary_type description-html],
          exclude: %w[country]
        } }
    end

    def disasters_params
      { limit: @limit,
        appname: 'givealittle',
        profile: 'list',
        preset: 'latest',
        fields: {
          include: %w[primary_country primary_type description-html],
          exclude: %w[country]
        } }
    end
end
