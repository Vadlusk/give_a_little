require 'rails_helper'

describe DisasterService do
  subject { DisasterService.new }
  context 'attributes' do
    it 'exists' do
      expect(subject).to be_a(DisasterService)
    end
  end
  context 'instance methods' do
    context 'returns all types of disasters' do
      it '.disasters' do
        expect(subject.disasters.length).to eq(10)
        expect(subject.disasters.first).to be_a(Disaster)
      end
    end
  end
end
