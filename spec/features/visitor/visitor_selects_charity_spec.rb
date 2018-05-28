require 'rails_helper'

describe 'visitor selects charity' do
  before(:each) do
    visit disaster_path(45829)
    click_on 'Donate Now'
  end
  scenario 'and pushes enter without being logged in' do
    save_and_open_page
    expect(page).to have_css('.charity', count: 15)
    expect(page).to have_button('Proceed to entering financial info')
  end
end
