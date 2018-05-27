require 'rails_helper'

describe 'visitor clicks on donate now' do
  before(:each) do
    visit disaster_path(45829)
    click_on 'Donate Now'
  end
  scenario 'and sees a list of associated charities to select from' do

  end
end
