require 'rails_helper'

describe 'user logs in' do
  let(:user) { create(:user) }
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    click_on "Logged in as: #{user.first_name}"
    click_on 'Edit Info'
  end
  scenario 'and edits their name' do
    fill_in 'user[first_name]', with: 'ThisMy'
    fill_in 'user[last_name]', with: 'NameNow'
    click_on 'Update Account'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Successfully updated account.')
    expect(User.last.first_name).to eq('ThisMy')
    expect(User.last.last_name).to eq('NameNow')
  end
end
