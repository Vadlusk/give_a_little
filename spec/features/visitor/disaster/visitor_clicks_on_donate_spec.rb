require 'rails_helper'

RSpec.describe 'visitor clicks on donate now' do
  scenario 'and sees the correct path and a list of charities' do
    VCR.use_cassette('charities_index') do
      visit disaster_path(45829)
      click_on 'Donate Now'

      expect(current_path).to eq('/charities')
      expect(page).to have_button('Proceed to entering financial info')
      within('.charities') do
        expect(page).to have_css('.charity', count: 15)
        expect(page).to have_css('.cause-img')
        expect(page).to have_css('.rating')
      end
    end
  end
end
