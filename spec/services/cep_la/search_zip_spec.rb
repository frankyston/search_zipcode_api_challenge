require 'rails_helper'

RSpec.describe "Search Zip" do
  
  describe "#call" do
    it '#perform' do
      VCR.use_cassette("search_zip") do
        response = CepLa::SearchZip.call('60010020')
        expect(response).to eq mock_response_cep_la
      end
    end
  end
end
