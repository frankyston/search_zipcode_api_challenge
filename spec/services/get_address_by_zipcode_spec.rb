require 'rails_helper'

RSpec.describe "Get Address by Zipcode" do
  
  describe "#call" do

    it "when zipcode have empty" do
      get_address_by_zipcode = GetAddressByZipcode.new('')
      expect(get_address_by_zipcode.call).to eq({ error: 'CEP inválido.' })
    end

    it "when zipcode have by more 8 numbers" do
      get_address_by_zipcode = GetAddressByZipcode.new('600100200')
      expect(get_address_by_zipcode.call).to eq({ error: 'CEP inválido.' })
    end

    it "when zipcode have by less 8 numbers" do
      get_address_by_zipcode = GetAddressByZipcode.new('6001002')
      expect(get_address_by_zipcode.call).to eq({ error: 'CEP inválido.' })
    end

    it 'when zipcode have dot and hiffen', :vcr do
      get_address_by_zipcode = GetAddressByZipcode.new('60.010-020')
      expect(get_address_by_zipcode.call).to eq(expected_response)
    end

    it 'when zipcode is valid', :vcr do
      get_address_by_zipcode = GetAddressByZipcode.new('60010020')
      expect(get_address_by_zipcode.call).to eq(expected_response)
    end

  end

  def expected_response
    { "cep" => "60010020", "uf" => "CE", "cidade" => "Fortaleza", "bairro" => "Moura Brasil", "logradouro" => "Rua Braga Torres" }
  end

end
