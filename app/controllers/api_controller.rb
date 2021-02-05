class ApiController < ApplicationController
  before_action :verify_jwt_token

  def test
    respond_to do |format|
      format.json { render json: {'sample' => 'data'}}
    end
  end

  def zipcode
    zipcode = params[:zipcode]
    address_response = GetAddressByZipcode.call(zipcode)
    address = NormalizeAddress.call(address_response)
    address.save
    respond_to do |format|
      format.json { render json: address_response }
    end
  end
end
