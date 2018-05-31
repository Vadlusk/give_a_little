require 'rails_helper'

describe 'user logs in' do
  let(:user) { create(:user) }
  before(:each) do
    visit dashboard_path
    click_on 'Log in'
  end
  scenario 'and sees their dashboard' do
    expect(current_path).to eq('/login')

    fill_in_credentials(user.email, user.password)

    expect(current_path).to eq('/dashboard')
    expect(page).to have_link('Log out')
    expect(page).to have_content("Logged in as #{user.first_name}")
  end
  context 'doesn\'t work when' do
    scenario 'the email isn\'t in my database already' do
      message = 'Email doesn\'t exist. Please create an account or try again.'

      fill_in_credentials('not@real.com', user.password)

      expect(page).to have_content(message)
    end
    scenario 'the password isn\'t correct' do
      message = 'Incorrect password. Please try again.'

      fill_in_credentials(user.email, 'nope')

      expect(page).to have_content(message)
    end
  end
end

def fill_in_credentials(email, password)
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'Log In'
end
