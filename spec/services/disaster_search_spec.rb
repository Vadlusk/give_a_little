require 'rails_helper'

describe DisasterSearch do
  subject { DisasterSearch.new }
  context 'attributes' do
    it 'exists' do
      expect(subject).to be_a(DisasterSearch)
    end
  end
  context 'class methods' do
    context 'returns all types of disasters' do
      expect(subject.all.length).to eq(10)
      expect(subject.all.first).to be_a(Disaster) 
    end
  end
end
