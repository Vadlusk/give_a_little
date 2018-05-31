require 'rails_helper'

describe 'user logs out' do
  it 'is possible' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_on 'Log out'

    expect(page).to have_link('Log in')
    expect(page).to have_link('Create an Account')
  end
end
