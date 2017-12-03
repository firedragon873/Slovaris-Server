class AddImageToWords < ActiveRecord::Migration[5.0]
  def self.up
    change_table :dictionary_words do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dictionary_words, :image
  end
end
