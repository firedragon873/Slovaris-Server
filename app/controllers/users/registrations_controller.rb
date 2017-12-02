class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  layout 'layouts/users'

  def i18n_scope
    [:users, :sessions]
  end

end
