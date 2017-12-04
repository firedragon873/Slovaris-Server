class MainController < BaseController

  def index
    @dictionaries = Dictionary::Dictionary.where(user_id: current_user.id)
                                          .includes(:words)
  end

  def i18n_scope
    [:main]
  end

  protected
    def account_params
      params.require(:user).permit(:name, :surname, :patronymic, :gender, :birthday, :avatar)
    end

end
