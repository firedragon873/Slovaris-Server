class MainController < BaseController

  def index
    @user = current_user
  end

  def update_account
    local_params = account_params
    @user = current_user
    @user.assign_attributes(local_params)
    @user.save
    puts @user.errors.messages
    redirect_to "/"
  end

  def i18n_scope
    [:main]
  end

  protected
    def account_params
      params.require(:user).permit(:name, :surname, :patronymic, :gender, :birthday, :avatar)
    end

end
