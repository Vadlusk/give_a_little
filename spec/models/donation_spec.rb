require 'rails_helper'

describe Donation do
  subject { Donation.from_data(donation_stub) }
  let(:user) { User.create!(
    id: 1,
    email: "AdLusk@Gmail.com",
    first_name: 'Jim',
    last_name: 'Bob',
    password: 'pass'
  ) }
  context 'relationships' do
    it { should belong_to(:user) }
  end
  context 'class methods' do
    context '#from_data' do
      it 'makes a new donation from response data' do
        expect(subject.panda_id).to eq('ch_5GRLoQw040BMwLCyEH6zgQ')
        expect(subject.charity_ein).to eq('10270690')
        expect(subject.charge_amount).to eq(3434)
      end
    end
  end
end
