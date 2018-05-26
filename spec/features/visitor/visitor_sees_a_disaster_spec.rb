require 'rails_helper'

describe 'visitor goes to a disaster page and' do
  it 'sees information about that disaster' do
    skip
    stub_request(:get, 'https://api.reliefweb.int/v1/disasters/8591?appname=give_a_little&profile=full')
      .to_return(status: 200, body: File.read('./spec/fixtures/disaster.json'))

    visit disaster_path()

    expect(page).to have_css('.type')
    expect(page).to have_css('.country')
    expect(page).to have_css('.location')
    expect(page).to have_css('.description')
    expect(page).to have_css('.number_affected')
    expect(page).to have_css('#small_map')
  end
end
