require 'rails_helper'

describe 'user logs in' do
  let(:user) { create(:user) }
  before(:each) do

    visit dashboard_path
    click_on 'Log in'
  end
  scenario 'and sees their dashboard' do
    expect(current_path).to eq('/login')

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Log In'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_link('Log out')
    expect(page).to have_content("Logged in as #{user.first_name}")
  end
  context 'doesn\'t work when' do
    scenario 'the email isn\'t in my database already' do
      message = "Email doesn't exist. Please create an account or try again."

      fill_in 'email', with: 'not@real.com'
      fill_in 'password', with: user.password
      click_on 'Log In'

      expect(page).to have_content(message)
    end
    scenario 'the password isn\'t correct' do
      message = "Incorrect password. Please try again."

      fill_in 'email', with: user.email
      fill_in 'password', with: 'nope'
      click_on 'Log In'

      expect(page).to have_content(message)
    end
  end
end
