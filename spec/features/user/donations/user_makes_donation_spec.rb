require 'rails_helper'

RSpec.describe 'user selects a charity', js: true do
  scenario 'and makes a successful donation' do
    VCR.use_cassette('donation') do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit disaster_path(45829)
      click_on 'Donate Now'
      choose 'charity_562125831'
      click_on 'Proceed to entering financial info'

      expect(current_path).to eq(new_donation_path)
      expect(page).to have_css('#panda_cc_form')

      fill_in_donation_info(user.first_name, user.last_name)
      click_on 'Make Donation'

      expect(current_path).to eq(tweets_path)
    end
  end
end
