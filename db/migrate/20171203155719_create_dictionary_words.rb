class CreateDictionaryWords < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionary_words do |t|
      t.string    :word
      t.integer   :language
      t.integer   :dictionary_id
      t.timestamps
    end
    add_index :dictionary_words, :dictionary_id
  end
end
