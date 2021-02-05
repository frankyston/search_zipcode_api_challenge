require 'rails_helper'

RSpec.describe "Get Address by Zipcode" do
  
  describe "#call" do
    it "when zipcode have empty" do
      expect(GetAddressByZipcode.call('')).to eq({ error: 'CEP inválido.' })
    end

    it "when zipcode have by more 8 numbers" do
      expect(GetAddressByZipcode.call('600100200')).to eq({ error: 'CEP inválido.' })
    end

    it "when zipcode have by less 8 numbers" do
      expect(GetAddressByZipcode.call('6001002')).to eq({ error: 'CEP inválido.' })
    end

    it 'when zipcode have dot and hiffen', :vcr do
      expect(GetAddressByZipcode.call('60.010-020')).to eq(mock_response_cep_la)
    end

    it 'when zipcode is valid', :vcr do
      expect(GetAddressByZipcode.call('60010020')).to eq(mock_response_cep_la)
    end
  end
end
