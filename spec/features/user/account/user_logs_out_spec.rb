require 'rails_helper'

RSpec.describe 'user logs out' do
  it 'is possible' do
    VCR.use_cassette('logout') do
      user = create(:user)

      visit root_path
      click_on 'Log in'
      fill_in_login_info(user.email, user.password)
      click_on 'Log out'

      expect(page).to have_link('Create an Account')
      expect(page).to have_link('Log in')
      expect(page).to_not have_link('Log out')
    end
  end
end
