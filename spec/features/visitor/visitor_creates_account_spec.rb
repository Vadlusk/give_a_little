require 'rails_helper'

describe 'visitor creates an account' do
  scenario 'works' do
    visit '/disasters'
    click_on 'Create an Account'

    expect(current_path).to eq(register_path)

    fill_in 'user[first_name]', with: 'New User'
    fill_in 'user[last_name]', with: 'Name'
    fill_in 'user[email]', with: 'New@email.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Create Account'

    expect(current_path).to eq(dashboard_path)
    within('.navbar') do
      expect(page).to have_content('Logged in as: New User')
      expect(page).to have_link('Log out')
    end
  end
end
