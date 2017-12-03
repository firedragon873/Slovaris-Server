class CreateDictionaryDictionaries < ActiveRecord::Migration[5.0]
  def change
    create_table :dictionary_dictionaries do |t|
      t.integer   :user_id
      t.integer   :language
      t.string    :name
      t.timestamps
    end
    add_index :dictionary_dictionaries, :user_id
  end
end
