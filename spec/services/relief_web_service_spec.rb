require 'rails_helper'

describe ReliefWebService do
  subject { ReliefWebService.new }
  context 'attributes' do
    it 'exists' do
      expect(subject).to be_a(ReliefWebService)
    end
  end
  context 'instance methods' do
    context 'returns all types of disasters' do
      it '.json_disasters' do
        VCR.use_cassette('.json_disasters') do
          expect(subject.json_disasters.length).to eq(10)
        end
      end
    end
  end
end
