module CepLa
  class SearchZip
    ENDPOINT = 'http://cep.la'.freeze

    attr_reader :zipcode

    def self.call(*args)
      new(*args).perform
    end

    def initialize(zipcode)
      @zipcode = zipcode
    end

    def perform
      url = "#{ENDPOINT}/#{@zipcode}"
      resp = Faraday.get(url) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = "application/json"
      end
      normalize(resp)
    end

    private

    def normalize(resp)
      JSON.parse resp.body
    end
  end
end
