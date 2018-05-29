require 'rails_helper'

describe 'visitor selects charity' do
  before(:each) do
    visit disaster_path(45829)
    click_on 'Donate Now'
  end
  scenario 'and proceeds without selecting a charity' do
    click_on 'Proceed to entering financial info'

    expect(page).to have_content('Please select a charity.')
  end
  scenario 'and proceeds without being logged in' do

    choose 'charity_061057497'
    click_on 'Proceed to entering financial info'

    expect(page).to have_content('Please login or create an account before donating.')
  end
end
