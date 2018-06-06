require 'rails_helper'

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

end
