require 'spec_helper'
require './app/models/disaster'

describe Disaster do
  let (:data) {
    {
      "id": "45829",
      "score": 1,
      "href": "https://api.reliefweb.int/v1/disasters/45829",
      "fields": {
        "date": {
          "created": "2018-05-23T00:00:00+00:00"
        },
        "primary_type": {
          "code": "TC",
          "name": "Tropical Cyclone",
          "id": 4618
        },
        "primary_country": {
          "href": "https://api.reliefweb.int/v1/countries/181",
          "name": "Oman",
          "location": {
            "lon": 57.09,
            "lat": 21.38
          },
          "id": 181,
          "iso3": "omn"
        },
        "name": "Tropical Cyclone Mekunu - May 2018",
        "description": "Really long desc, lots of details.",
        "glide": "TC-2018-000062-OMN",
        "type": [
          {
            "name": "Tropical Cyclone"
          }
        ],
        "url": "https://reliefweb.int/taxonomy/term/45829",
        "status": "alert"
      }
    }
  }

  subject { Disaster.new(data) }

  it 'exists with valid attributes' do
    expect(subject.date).to eq('2018-01-01 00:00:00 -0700')
    expect(subject.type).to eq('Tropical Cyclone')
    expect(subject.country).to eq('Oman')
    expect(subject.longitude).to eq(57.09)
    expect(subject.latitude).to eq(21.38)
    expect(subject.description).to eq('Really long desc, lots of details.')
    expect(subject.rw_id).to eq(45829)
  end
end
