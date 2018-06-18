require 'rails_helper'

RSpec.describe 'visitor goes to create account page' do
  scenario 'and uses twitter oauth' do
    VCR.use_cassette('twitter_oauth') do
      visit disasters_path
      click_on 'Create an Account'
      stub_twitter_omniauth
      click_on 'Continue with Twitter'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Logged in as:')
      expect(page).to have_css('.twitter-logo')
      expect(page).to_not have_css('.google-logo')
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
      expect(page).to_not have_css('.twitter-logo')
      expect(page).to have_css('.google-logo')
      expect(page).to_not have_link('Log in')
      expect(page).to_not have_link('Create an Account')
      expect(User.all.length).to eq(1)
    end
  end
  scenario 'and uses google and then twitter oauth' do
    VCR.use_cassette('two_oauths') do
      visit disasters_path
      click_on 'Create an Account'
      stub_google_omniauth
      click_on 'Continue with Google'
      click_on 'Log out'
      click_on 'Log in'
      click_on 'Continue with Twitter'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Logged in as:')
      expect(page).to have_css('.twitter-logo')
      expect(page).to have_css('.google-logo')
      expect(page).to_not have_link('Log in')
      expect(page).to_not have_link('Create an Account')
    end
  end
end
