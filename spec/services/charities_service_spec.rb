require 'rails_helper'

describe CharitiesService do
  subject { CharitiesService.new('Flood') }
  context 'attributes' do
    it 'exists with a type of disaster' do
      expect(subject).to be_a(CharitiesService)
    end
  end
  context 'instance methods' do
    context 'returns a list of charities' do
      it '.charities' do
        expect(subject.charities.length).to eq(15)
        expect(subject.charities.first).to be_a(Charity)
      end
    end
  end
end
