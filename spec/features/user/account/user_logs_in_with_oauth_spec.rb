require 'rails_helper'

describe 'visitor creates an account' do
  subject { create(:user, first_name: 'Valane Adam Lusk') }
  scenario 'by using twitter oauth' do
    VCR.use_cassette('returning_twitter_user') do
      stub_twitter_omniauth
      visit root_path
      click_on 'Create an Account'
      click_on 'Continue with Twitter'
      click_on 'Log out'
      click_on 'Log in'
      click_on 'Continue with Twitter'

      expect(page).to have_content("Welcome back, #{subject.first_name}.")
      expect(current_path).to eq(dashboard_path)
    end
  end
end
