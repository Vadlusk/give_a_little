class ReliefWebService

  def initialize
    @conn = Faraday.new('https://api.reliefweb.int/v1/disasters')
  end

  def json_disasters
    JSON.parse(response.body)['data']
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

    def response
      @response ||= conn.get do |req|
        req.params = params
      end
    end
end
