require 'rails_helper'

describe 'visitor goes to the disasters page and' do
  it 'sees a map with pins in it' do
    visit '/disasters'

    expect(page).to have_css('#map')
  end
end
