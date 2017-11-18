class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception,
                       prepend: true
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied, :with => :error_render_method

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to "/sign_in"
    end
  end

  def error_render_method
    render :file => "public/401.html", :status => :unauthorized
  end

  def after_sign_out_path_for(resource_or_scope)
    "/sign_in"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
