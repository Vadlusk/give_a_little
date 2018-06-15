require 'rails_helper'

describe PandaPayService do
  let(:data) { {:source=>"cBOCDezOtgCOrLStSvmsz7bpHp", :amount=>"1423", :destination=>2164023, :email=>"AdLusk@gmail.com"} }
  subject { PandaPayService.new(data) }
  context 'attributes' do
    it 'exists with good info' do
      expect(subject).to be_a(PandaPayService)
    end
  end
  context 'instance methods' do
    context 'returns json with receipt info' do
      it '.json_receipt' do
        VCR.use_cassette('.json_receipt') do
          message = { errors: [{
              type: 'invalid_parameters',
              message: 'Source was declined' }] }

          expect(subject.json_receipt).to eq(message)
        end
      end
    end
  end
end
