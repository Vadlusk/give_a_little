require 'rails_helper'

describe 'visitor selects charity' do
  before(:each) do
    visit disaster_path(45829)
    click_on 'Donate Now'
  end
  scenario 'and pushes enter without being logged in' do
    expect(page).to have_button('.charity', count: 15)
    expect(page).to have_button('Proceed to entering financial info')
  end
end
