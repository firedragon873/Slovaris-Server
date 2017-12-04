class Dictionary::DictionariesController < BaseController

  def new
    @dictionary = Dictionary::Dictionary.new
  end

  def create
    @dictionary = Dictionary::Dictionary.new(dictionary_params)
    @dictionary.save
    redirect_to "/"
  end

  def i18n_scope
    [:dictionary, :dictionary]
  end

  protected
    def dictionary_params
      p = params.require(:dictionary).permit(:name, :language)
      p[:user_id] = current_user.id
      p
    end

end
