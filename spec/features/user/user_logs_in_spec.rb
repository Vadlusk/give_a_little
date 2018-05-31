require 'rails_helper'

describe 'user logs in' do
  it 'and sees their dashboard' do
    user = create(:user)

    visit dashboard_path
    click_on 'Log in'

    expect(current_path).to eq('/login')

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log In'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_link('Log out')
    expect(page).to have_content("Logged in as #{user.first_name}")
  end
end
