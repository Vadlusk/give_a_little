require 'rails_helper'

describe 'user selects a charity' do
  scenario 'and makes a successful donation' do
    VCR.use_cassette('donation') do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit disaster_path(45829)
      click_on 'Donate Now'
      choose 'charity_311811917'
      click_on 'Proceed to entering financial info'

      expect(current_path).to eq(new_donation_path)

      fill_in 'first_name', with: user.first_name
      fill_in 'last_name', with: user.last_name
      fill_in 'credit_card_number', with: 4111111111111111
      fill_in 'expiration', with: 07/2018
      fill_in 'CVV', with: 123
      click_on 'Make Donation'

      expect(page).to have_content('Your donation was successful.')
      expect(Donation.all.count).to eq(1)
    end
  end
end
