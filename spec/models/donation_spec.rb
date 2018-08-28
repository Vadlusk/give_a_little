require 'rails_helper'

RSpec.describe Donation do
  subject { Donation.from_data(donation_stub) }
  before(:each) do
  user = User.create!(
    id: 1,
    email: "AdLusk@Gmail.com",
    first_name: 'Jim',
    last_name: 'Bob',
    password: 'pass'
  )
  end
  context 'relationships' do
    it { should belong_to(:user) }
  end
  context 'class methods' do
    context '#from_data' do
      it 'makes a new donation from response data' do

        expect(subject.user_id).to eq(1)
        expect(subject.panda_id).to eq('ch_5GRLoQw040BMwLCyEH6zgQ')
        expect(subject.charity_ein).to eq('10270690')
        expect(subject.charge_amount).to eq(3434)
      end
    end
  end
end
