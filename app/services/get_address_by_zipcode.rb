class GetAddressByZipcode
  attr_reader :zipcode

  def self.call(*args)
    new(*args).perform
  end

  def initialize(zipcode)
    @zipcode = clear_zipcode(zipcode)
  end

  def perform
    if zipcode_valid?
      CepLa::SearchZip.call(@zipcode)
    else
      { error: 'CEP inválido.' }
    end
  end

  private

  def more_eight_number?
    @zipcode.size > 8
  end

  def less_eight_number?
    @zipcode.size < 8
  end

  def zipcode_valid?
    !@zipcode.empty? && !more_eight_number? && !less_eight_number?
  end

  def clear_zipcode(zipcode)
    zipcode.gsub('.', '').gsub('-', '')
  end
end

# zipcode vázio
# zipcode menos de 8
# zipcode mais de 8
