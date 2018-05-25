require 'rails_helper'

describe 'visitor goes to a disaster page and' do
  subject { create(:disaster) }
  it 'sees information about that disaster' do
    visit disaster_path(subject)

    expect(page).to have_content(subject.type)
    expect(page).to have_content(subject.location)
    expect(page).to have_css('.number_affected')
    expect(page).to have_css('#small_map')
  end
end
