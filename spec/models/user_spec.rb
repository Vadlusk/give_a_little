require 'rails_helper'

RSpec.describe User do

  subject { User.create(
    first_name: 'Al',
    last_name: 'Bundy',
    password: '123') }

  let(:email) { 'email@email.com' }

  context 'field validations' do
    it 'is invalid without an email' do
      expect(subject).to_not be_valid
    end
    it 'is valid with an email' do
      subject.update(email: email)

      expect(subject).to be_valid
    end
    it 'an email must be unique' do
      subject.update(email: email)
      user = User.create(
        first_name: 'Al',
        last_name: 'Bundy',
        password: '123',
        email: email
      )

      expect(user).to_not be_valid
    end
  end
  context 'relationships' do
    it { should have_many(:donations) }
  end
  context 'class methods' do
    it '#from_omniauth' do

    end
  end
end
