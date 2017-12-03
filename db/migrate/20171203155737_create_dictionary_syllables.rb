class CreateDictionarySyllables < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionary_syllables do |t|
      t.integer   :word_id
      t.string    :syllable
      t.integer   :language
      t.timestamps
    end
    add_index :dictionary_syllables, :word_id
  end
end
