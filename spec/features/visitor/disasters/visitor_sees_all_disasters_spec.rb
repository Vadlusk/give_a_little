require 'rails_helper'

describe 'visitor goes to the disasters page and' do
  it 'sees a map with pins in it' do
    VCR.use_cassette('disasters_index') do
      visit disasters_path

      expect(page).to have_css('#map')
      save_and_open_page
    end
  end
  it 'sees filters that manipulate the available disasters' do
    VCR.use_cassette('disasters_index') do
      visit disasters_path
      fill_in :limit, with: 44

      expect(page).to have_content('in', count: 44)
    end
  end
end
