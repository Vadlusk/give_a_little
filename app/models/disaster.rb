class Disaster
  attr_reader :date, :type, :country, :longitude, :latitude,
              :description, :rw_id

  def initialize(data)
    @date        = Time.parse(data['fields']['date']['created'])
    @type        = data['fields']['primary_type']['name']
    @country     = data['fields']['primary_country']['name']
    @longitude   = data['fields']['primary_country']['location']['lon']
    @latitude    = data['fields']['primary_country']['location']['lat']
    @description = data['fields']['description-html']
    @rw_id       = data['id'].to_i
  end

  def format_date
    @date.strftime('%b %d, %Y')
  end
end
