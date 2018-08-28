require 'rails_helper'

RSpec.describe 'visitor selects charity' do
  scenario 'and proceeds without and then with selecting a charity' do
    VCR.use_cassette('charity_selection') do
      visit disaster_path(45829)
      click_on 'Donate Now'
      click_on 'Proceed to entering financial info'

      expect(page).to have_content('Please select a charity.')

      choose 'charity_562125831'
      click_on 'Proceed to entering financial info'

      expect(page).to have_content('Please login or create an account before donating.')
    end
  end
end
