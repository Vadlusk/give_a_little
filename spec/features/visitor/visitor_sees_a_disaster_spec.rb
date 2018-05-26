require 'rails_helper'

describe 'visitor goes to a disaster page and' do
  it 'sees information about that disaster' do
    visit disasters_path

    within(first('.link')) do
      click_on '45829'
    end

    expect(page).to have_css('.type')
    expect(page).to have_css('.country')
    expect(page).to have_css('.description')
    expect(page).to have_css('#small_map')
  end
end
