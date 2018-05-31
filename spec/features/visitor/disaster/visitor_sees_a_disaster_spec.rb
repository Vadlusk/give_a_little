require 'rails_helper'

describe 'visitor goes to a disaster page and' do
  before(:each) do
    visit disasters_path

    within(first('.link')) do
      click_on '45829'
    end
  end
  it 'sees the correct path' do
    expect(current_path).to eq('/disasters/45829')
  end
  it 'sees information about that disaster' do
    expect(page).to have_css('.type')
    expect(page).to have_css('.country')
    expect(page).to have_css('.description')
    expect(page).to have_css('#small_map')
  end
  it 'sees a link to donate' do
    expect(page).to have_link('Donate Now')
  end
end