require 'rails_helper'

RSpec.describe "Search Zip" do
  
  describe "#call" do
    it '#perform' do
      VCR.use_cassette("search_zip") do
        response = CepLa::SearchZip.call('60010020')
        expect(response).to eq expected_response
      end
    end
  end

  def expected_response
    { "cep" => "60010020", "uf" => "CE", "cidade" => "Fortaleza", "bairro" => "Moura Brasil", "logradouro" => "Rua Braga Torres" }
  end
end
