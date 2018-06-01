require 'rails_helper'

describe 'user logs out' do
  it 'is possible' do
    VCR.use_cassette('logout') do
      user = create(:user)

      visit dashboard_path
      click_on 'Log in'
      fill_in_credentials(user.email, user.password)
      click_on 'Log out'

      expect(page).to have_link('Create an Account')
      expect(page).to_not have_link('Log out')
    end
  end
end
