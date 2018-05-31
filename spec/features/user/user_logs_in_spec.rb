require 'rails_helper'

describe 'user logs in' do
  it 'and sees their dashboard' do
    user = create(:user)

    click_on 'Log in'

    expect(current_path).to eq('/login')

    fill_in 'user[email]', with: 'New@email.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Log in'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_link('Log out')
    expect(page).to have_content("Logged in as #{user.first_name}")
  end
end
