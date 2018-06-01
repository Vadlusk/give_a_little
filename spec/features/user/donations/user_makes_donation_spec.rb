require 'rails_helper'

describe 'user selects a charity' do
  scenario 'and makes a successful donation' do
    VCR.use_cassette('donation') do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit disaster_path(45829)
      click_on 'Donate Now'
      choose 'charity_061057497'
      click_on 'Proceed to entering financial info'

      expect(current_path).to eq('/donate')

      fill_in 'First Name', with: 'Felipe'
      fill_in 'Last Name', with: 'O Keefe'
      fill_in 'Credit Card Number', with: 4111111111111111
      fill_in 'Expiration', with: 07/2018
      fill_in 'CVV', with: 123
      click_on 'Tokenize!'

      expect(current_path).to eq('/tweet')
      expect(page).to have_content('Thanks for your donation.')
      expect(Donation.all.count).to eq(1)
    end
  end
end
