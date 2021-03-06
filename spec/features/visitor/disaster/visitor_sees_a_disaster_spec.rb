require 'rails_helper'

RSpec.describe 'visitor goes to a disaster page and' do
  scenario 'sees all the info they should see' do
    VCR.use_cassette('disaster_show') do
      visit disasters_path

      click_on 'Chart View'
      within(first('.link')) do
        click_on '45934'
      end

      expect(current_path).to eq('/disasters/45934')
      expect(page).to have_css('.type')
      expect(page).to have_css('.country')
      expect(page).to have_css('.description')
      expect(page).to have_css('#small_map')
      expect(page).to have_link('Donate Now')
    end
  end
end
