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
    fill_in :first_name, with: 'ThisMy'
    fill_in :last_name, with: 'NameNow'

    expect(user.first_name).to eq('ThisMy')
    expect(user.last_name).to eq('NameNow')
  end
end
