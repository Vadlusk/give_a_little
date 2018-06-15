class ReliefWebService
  def initialize(id = '', limit = nil, types = nil)
    @id    = id
    @limit = limit
    @types = types
    @conn  = Faraday.new('https://api.reliefweb.int')
  end

  def json_disaster
    JSON.parse(response("/v1/disasters/#{@id}").body)['data'][0]
  end

  def json_disasters
    JSON.parse(response('/v1/disasters').body)['data']
  end

  private

    def response(uri)
      @response ||= @conn.get(uri) do |req|
        req.params = params
      end
    end

    def params
      { limit: @limit,
        appname: 'givealittle',
        profile: 'list',
        preset: 'latest',
        fields: {
          include: %w[primary_country primary_type description-html],
          exclude: %w[country]
        },
        filter: ({
          field: 'primary_type.name',
          value: @types,
          operator: 'OR'
        } if @types) }.delete_if { |_k, v| v.nil? }
    end
end
