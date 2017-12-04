class AccountController < BaseController

  def index
    @user = current_user
  end

  def update_account
    local_params = account_params
    @user = current_user
    @user.assign_attributes(local_params)
    @user.save
    redirect_to "/account"
  end

  def i18n_scope
    [:account]
  end

  protected
    def account_params
      params.require(:user).permit(:name, :surname, :patronymic, :gender, :birthday, :avatar)
    end

end
