require 'rails_helper'

describe 'user logs in' do
  let(:user) { create(:user) }
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    click_on "Logged in as: #{user.first_name}"
    click_on 'Edit Info'
  end
  scenario 'and edits their name and email' do
    fill_in 'user[first_name]', with: 'ThisMy'
    fill_in 'user[last_name]', with: 'NameNow'
    fill_in 'user[email]', with: 'Name@Now.com'
    click_on 'Update Account'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Successfully updated account.')
    expect(User.last.first_name).to eq('ThisMy')
    expect(User.last.last_name).to eq('NameNow')
    expect(User.last.email).to eq('Name@Now.com')
  end
  scenario 'and edits their password' do
    skip
    VCR.use_cassette('password_edit') do
      fill_in 'user[password]', with: 'lazy'
      fill_in 'user[password_confirmation]', with: 'lazy'
      click_on 'Update Account'
      click_on "Logged in as: #{user.first_name}"
      click_on 'Log out'
      click_on 'Log in'
      fill_in 'email',    with: user.email
      fill_in 'password', with: 'lazy'

      expect(page).to have_content("Welcome back, #{user.first_name}.")
    end
  end
end
