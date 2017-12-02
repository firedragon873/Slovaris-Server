class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception,
                       prepend: true
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied, :with => :error_render_method

  protected
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

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      @i18n_scope = i18n_scope
    end

    def i18n_scope
      []
    end

    def configure_permitted_parameters

    end

end
