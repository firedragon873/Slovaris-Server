class Api::Users::RegistrationsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  respond_to :json

  def create
    simple_json_response("Registration") do
      new_user = User.new(user_params)
      unless new_user.save
        translated_errors = translated_errors_from_model(new_user)
        messages = translated_errors.map do |message|
          message.map { |key, value| "#{key} #{value}"}
        end
        raise UserException.new("Not registered", messages.uniq)
      end
      sign_in(new_user, store: true)
      {}
    end
  end

  def user_params
    p = params.require(:user).permit(:login, :password, :password_confirmation, :name, :gender, :birthday)
    p[:email] = p[:login]
    p
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:login, :password, :password_confirmation, :name, :gender, :birthday)
    end
  end

end
