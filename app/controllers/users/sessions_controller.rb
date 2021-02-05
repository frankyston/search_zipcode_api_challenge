class Users::SessionsController < Devise::SessionsController
  require 'auth_token'

  respond_to :html, :json

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?

    token = AuthToken.issue_token({ user_id: resource.id })
    respond_to do |format|
      format.json { render json: {user: resource.email, token: token} }
    end
  end
end
