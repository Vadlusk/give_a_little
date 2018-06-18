require 'rails_helper'

RSpec.describe CharitiesService do
  subject { CharitiesService.new('Flood') }
  context 'attributes' do
    it 'exists with a type of disaster' do
      expect(subject).to be_a(CharitiesService)
    end
  end
  context 'instance methods' do
    context 'returns a list of json charities' do
      it '.json_charities' do
        VCR.use_cassette('.json_charities') do
          expect(subject.json_charities.length).to eq(15)
        end
      end
    end
  end
end
