require 'rails_helper'

describe 'visitor selects charity' do
  before(:each) do
    visit disaster_path(45829)
    click_on 'Donate Now'
  end
  scenario 'and pushes enter without being logged in' do
    click_on 'Proceed to entering financial info'

    expect(page).to have_content('Please select a charity.')

    choose 'charity_061057497'
    click_on 'Proceed to entering financial info'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Please login or create account before donating.')
  end
end
