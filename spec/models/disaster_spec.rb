require 'spec_helper'
require './app/models/disaster'

describe Disaster do
  let (:data) {
    		{
    			"fields": {
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
    				"description-html": "
    On the 21st of May 2003, a powerful earthquake struck northern Algeria.  More than 2,200 people died, injuring more than 10,000 and leaving at least 180,000 homeless IFRC, 24 Jul 2006. As of June 2003, 150,000 people were living in 185 camps established to host affected people OCHA, 23 Jun 2003

    \n"
    			},
    			"id": "5665"
    		}
      }

  subject { Disaster.new(data) }

  it 'exists with valid attributes' do
    skip
    expect(subject.date).to eq('2018-01-01 00:00:00 -0700')
    expect(subject.type).to eq('Tropical Cyclone')
    expect(subject.country).to eq('Oman')
    expect(subject.longitude).to eq(57.09)
    expect(subject.latitude).to eq(21.38)
    expect(subject.description).to eq('Really long desc, lots of details.')
    expect(subject.rw_id).to eq(45829)
  end
end
