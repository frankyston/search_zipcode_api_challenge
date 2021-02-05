require 'rails_helper'

RSpec.describe "Normalize Address" do
  describe "#call" do

    it 'should normalized object for Address' do
      object = NormalizeAddress.call(mock_response_cep_la)
      expect(object.zipcode).to eq(mock_response_cep_la['cep'])
    end

  end
end
