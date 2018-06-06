require 'rails_helper'

describe DonationPost do
  subject { DonationPost.new().json }
  context 'it returns a valid json response' do
    VCR.use_cassette('donation_post.json') do

    end
  end
end
