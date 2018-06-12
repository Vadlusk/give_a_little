require 'rails_helper'

describe 'user logs in' do
  let(:user) { create(:user) }
  let(:donations) { create_list(:donation, 10, user_id: user.id) }
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
  end
  scenario 'and sees their personal info' do
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
  end
  scenario 'and sees their donations' do
    donations.each do |donation|
      expect(page).to have_content(donation.charity_ein)
    end
  end
end
