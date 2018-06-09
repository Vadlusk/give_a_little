class ReliefWebService

  def initialize
    @conn = Faraday.new('https://api.reliefweb.int')
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
          include: ['primary_country', 'primary_type', 'description'],
          exclude: ['country']
        } }
    end

    def response(uri)
      @response ||= conn.get(uri) do |req|
        req.params = params
      end
    end
end
