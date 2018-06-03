require 'spec_helper'
require './app/models/disaster'

describe Disaster do
  let (:data) {
    {
      "fields": {
        "date": {
          "created": "2003-05-21T00:00:00+00:00"
        },
        "primary_type": {
          "code": "EQ",
          "name": "Earthquake",
          "id": 4628
        },
        "primary_country": {
          "href": "https://api.reliefweb.int/v1/countries/16",
          "name": "Algeria",
          "location": {
            "lon": 2.63,
            "lat": 28.16
          },
          "id": 16,
          "iso3": "dza"
        },
        "description-html": "Really long desc, lots of details.",
        "name": "Algeria: Earthquake - May 2003",
        "glide": "EQ-2003-0245-DZA",
        "type": [
          {
            "name": "Earthquake"
          }
        ],
        "url": "https://reliefweb.int/taxonomy/term/5665",
        "status": "past"
      },
      "id": "5665"
    }
  }

  subject { Disaster.new(data) }

  it 'exists with valid attributes' do
    skip
    expect(subject.date).to eq(Time.new("2003-05-21T00:00:00+00:00"))
    expect(subject.type).to eq('Earthquake')
    expect(subject.country).to eq('Algeria')
    expect(subject.longitude).to eq(2.63)
    expect(subject.latitude).to eq(28.16)
    expect(subject.description).to eq('Really long desc, lots of details.')
    expect(subject.rw_id).to eq(5665)
  end
end
