class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  layout 'layouts/users'

  def i18n_scope
    [:users, :sessions]
  end
end
