require 'rails_helper'

describe 'visitor clicks on donate now' do
  before(:each) do
    visit disaster_path(45829)
    click_on 'Donate Now'
  end
  scenario 'and sees the correct path' do
    expect(current_path).to eq('/charities')
  end
  scenario 'and sees a list of associated charities to select from' do
    expect(page).to have_css('.charities')
    within('.charities') do
      expect(page).to have_css('.charity-name')
      expect(page).to have_css('.rating')
      expect(page).to have_css('.cause-img')
    end
  end
end
