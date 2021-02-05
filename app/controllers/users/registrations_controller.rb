class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    set_flash_message! :notice, :signed_up
    if resource.persisted?
      sign_up(resource_name, resource)

      token = AuthToken.issue_token({ user_id: resource.id })
      respond_to do |format|
        format.json { render json: {user: resource.email, token: token} }
      end
    else
      respond_to do |format|
        format.json { render json: { error: resource.errors.full_messages } }
      end
    end
  end
end
