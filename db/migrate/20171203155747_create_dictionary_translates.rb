class CreateDictionaryTranslates < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionary_translates do |t|
      t.integer   :word_id
      t.string    :translate
      t.float     :freq_of_use
      t.timestamps
    end
    add_index :dictionary_translates, :word_id
  end
end
