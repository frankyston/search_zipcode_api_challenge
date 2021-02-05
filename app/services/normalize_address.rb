class NormalizeAddress
  attr_reader :data

  def self.call(*args)
    new(*args).perform
  end

  def initialize(data)
    @data = data
  end

  def perform
    address = Address.find_or_initialize_by(zipcode: data['cep']) do |address|
      address.state = data['uf']
      address.city = data['cidade']
      address.neighborhood = data['bairro']
      address.street = data['logradouro']
    end
  end
end
