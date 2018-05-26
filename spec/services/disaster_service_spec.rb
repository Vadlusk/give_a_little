require 'rails_helper'

describe DisasterService do
  let(:rw_id) { 8510 }
  subject { DisasterService.new(rw_id) }
  context 'attributes' do
    it 'exists' do
      expect(subject).to be_a(DisasterService)
    end
  end
  context 'instance methods' do
    context 'returns one disaster' do
      it '.disaster' do
        expect(subject.disaster).to be_a(Disaster)
      end
    end
  end
end
