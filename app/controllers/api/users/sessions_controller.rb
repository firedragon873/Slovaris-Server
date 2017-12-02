class Api::Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  respond_to :json

  def create
    simple_json_response("Login") do
      warden.authenticate!(auth_options)
      user = current_user
      sign_in(user, store: true)
      { }
    end
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {}
                    }
  end

  protected
    def auth_options
      { scope: resource_name }
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      end
    end
end
