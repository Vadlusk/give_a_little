require 'rails_helper'

describe Charity do
  let (:data) {
    {
    "charityNavigatorURL": "https://www.charitynavigator.org/?bay=search.summary&orgid=5954&utm_source=DataAPI&utm_content=b16336bb",
    "mission": "The MDI Biological Laboratory is a rapidly growing, independent non-profit biomedical research institution. Its mission is to improve human health and well-being through basic research, education, and development ventures that transform discoveries into cures.",
    "websiteURL": "http://www.mdibl.org/",
    "tagLine": "Connecting Science, Environment, and Health",
    "charityName": "Mount Desert Island Biological Laboratory",
    "ein": "010202467",
    "orgID": 5954,
    "currentRating": {
      "score": 94.62,
      "ratingID": 122841,
      "publicationDate": "2017-07-01T04:00:00.000Z",
      "ratingImage": {
        "small": "https://d20umu42aunjpx.cloudfront.net/_gfx_/icons/stars/4starsb.png",
        "large": "https://d20umu42aunjpx.cloudfront.net/_gfx_/icons/stars/4stars.png"
      },
      "rating": 4,
      "financialRating": {
        "score": 93.54,
        "rating": 4
      },
      "accountabilityRating": {
        "score": 96,
        "rating": 4
      }
    },
    "category": {
      "categoryName": "Research and Public Policy",
      "categoryID": 11,
      "charityNavigatorURL": "https://www.charitynavigator.org/index.cfm?bay=search.categories&categoryid=11&utm_source=DataAPI&utm_content=b16336bb",
      "image": "https://d20umu42aunjpx.cloudfront.net/_gfx_/icons/categories/research.png"
    },
    "cause": {
      "causeID": 35,
      "causeName": "Non-Medical Science & Technology Research",
      "charityNavigatorURL": "https://www.charitynavigator.org/index.cfm?bay=search.results&cgid=11&cuid=35&utm_source=DataAPI&utm_content=b16336bb",
      "image": "https://d20umu42aunjpx.cloudfront.net/_gfx_/causes/small/nonmedical.jpg"
    },
    "irsClassification": {
      "deductibility": "Contributions are deductible",
      "subsection": "501(c)(3)",
      "nteeType": "Science and Technology Research Institutes, Services",
      "foundationStatus": "Organization that normally receives no more than one-third of its support from gross investment income and unrelated business income and at the same time more than one-third of its support from contributions, fees, and gross receipts related to exempt purposes.  509(a)(2)",
      "nteeSuffix": "0",
      "nteeClassification": "Biological, Life Science Research",
      "deductibilityDetail": null,
      "nteeCode": "U50",
      "nteeLetter": "U"
    },
    "mailingAddress": {
      "country": null,
      "stateOrProvince": "ME",
      "city": "Bar Harbor",
      "postalCode": "04609",
      "streetAddress1": "159 Old Bar Harbor Road",
      "streetAddress2": null
    },
    "donationAddress": {
      "country": null,
      "stateOrProvince": "ME",
      "city": "Salisbury Cove",
      "postalCode": "04672",
      "streetAddress1": "PO Box 35",
      "streetAddress2": null
    },
    "advisories": {
      "severity": null,
      "active": {
        "_rapid_links": {
          "related": {
            "href": "https://api.data.charitynavigator.org/v2/Organizations/010202467/Advisories?status=ACTIVE"
          }
        }
      }
    }
  }

  subject { Charity.new(data) }

  it 'exists with valid attributes' do
    expect(subject.name).to eq('Mount Desert Island Biological Laboratory')
    expect(subject.ein).to eq('010202467')
    expect(subject.mission).to eq('The MDI Biological Laboratory is a rapidly growing, independent non-profit biomedical research institution. Its mission is to improve human health and well-being through basic research, education, and development ventures that transform discoveries into cures.')
    expect(subject.rating).to eq(94.62)
    expect(subject.cause).to eq('Non-Medical Science & Technology Research')
    expect(subject.cause_img).to eq('https://d20umu42aunjpx.cloudfront.net/_gfx_/causes/small/nonmedical.jpg')
    expect(subject.cause_id).to eq(35)
  end
end
