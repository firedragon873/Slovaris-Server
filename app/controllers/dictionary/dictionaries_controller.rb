class Dictionary::DictionariesController < BaseController

  def new
    @dictionary = Dictionary::Dictionary.new
  end

  def create
    @dictionary = Dictionary::Dictionary.new(dictionary_params)
    @dictionary.save
    redirect_to "/"
  end

  def edit
    @dictionary = find_by_id
  end

  def new_word
    @dictionary = find_by_id
    @word = Dictionary::Word.new(dictionary_id: @dictionary.id, language: @dictionary.language)
    render partial: "word", layout: false, locals: { word: @word }
  end

  def new_translate
    @translate = Dictionary::Translate.new
    render partial: "translate", layout: false, locals: { translate: @translate }
  end

  def update
    @dictionary = find_by_id
    local_params = dictionary_params
    @dictionary.assign_attributes(local_params)
    @dictionary.save
    redirect_to "/"
  end

  def i18n_scope
    [:dictionary, :dictionary]
  end

  protected

    def find_by_id
      Dictionary::Dictionary.where(id: params[:id])
                                          .includes(words: [:translates, :syllables])
                                          .first
    end

    def dictionary_params
      p = restore_empty_arrays(params.require(:dictionary)
                                     .permit(:name, :language, words_attributes: [:id, :word, :image, translates_attributes: [:id, :position, :translate]]).to_h,
                                          params,
                                          [:words_attributes])
      p[:words_attributes] = p[:words_attributes].map do |word_attributes|
        if word_attributes[:id].present?
          word = Dictionary::Word.find(word_attributes[:id])
          word_attributes[:translates_attributes] = add_delete_info(word_attributes[:translates_attributes].to_a,
                                                                    word.translates)
        end
        word_attributes
      end
      p[:words_attributes] = add_delete_info(p[:words_attributes].to_a,
                                             @dictionary.words)
      p[:user_id] = current_user.id
      puts p
      p
    end



end
