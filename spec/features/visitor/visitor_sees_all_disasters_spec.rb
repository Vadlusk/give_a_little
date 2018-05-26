require 'rails_helper'

describe 'visitor goes to the disasters page and' do
  it 'sees a map with pins in it' do
    stub_request(:get, 'https://api.reliefweb.int/v1/disasters?appname=give_a_little&profile=full')
      .to_return(status: 200, body: File.read('./spec/fixtures/disasters.json'))

    visit disasters_path

    expect(page).to have_css('#map')
  end
end
