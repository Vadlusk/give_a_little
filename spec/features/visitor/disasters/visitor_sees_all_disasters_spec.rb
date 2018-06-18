require 'rails_helper'

RSpec.describe 'visitor goes to the disasters page and' do
  it 'sees a map with pins in it' do
    VCR.use_cassette('disasters_index') do
      visit disasters_path

      expect(page).to have_css('#map')
    end
  end
  it 'sees filters that manipulate the available disasters' do
    VCR.use_cassette('disasters_index_limit') do
      visit disasters_path
      fill_in :limit, with: 44
      click_on 'Update map'

      expect(page).to have_css('#map')
    end
  end
end
