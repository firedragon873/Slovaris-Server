class SlovarisFailureApp < Devise::FailureApp

  def respond
    if http_auth?
      if request.format == :json
        json_auth
      else
        http_auth
      end
    elsif warden_options[:recall]
      recall
    else
      if request.format == :json
        json_auth
      else
        redirect
      end
    end
  end

  def json_auth
    self.status = 401
    self.content_type = 'application/json'
    response = { success: false,
                 info: "Login Failed",
                 data: nil,
                 errors: {
                   title:  I18n.t(:authenticate_error_title, scope: [:api, :sessions]),
                   errors: [i18n_message]
                 }
               }
    self.response_body = response.to_json
  end

  def redirect_url
    "/sign_in"
  end
end
