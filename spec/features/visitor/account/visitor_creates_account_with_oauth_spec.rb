require 'rails_helper'

describe 'visitor goes to create account page' do
  scenario 'and uses twitter oauth' do
    VCR.use_cassette('twitter_oauth') do
      visit disasters_path
      click_on 'Create an Account'
      stub_twitter_omniauth
      click_on 'Continue with Twitter'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Logged in as:')
      expect(page).to_not have_link('Log in')
      expect(page).to_not have_link('Create an Account')
      expect(User.all.length).to eq(1)
    end
  end
  scenario 'and uses google oauth' do
    VCR.use_cassette('google_oauth') do
      visit disasters_path
      click_on 'Create an Account'
      stub_google_omniauth
      click_on 'Continue with Google'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Logged in as:')
      expect(page).to_not have_link('Log in')
      expect(page).to_not have_link('Create an Account')
      expect(User.all.length).to eq(1)
    end
  end
end
