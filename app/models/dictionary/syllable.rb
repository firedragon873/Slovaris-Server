class Dictionary::Syllable < ApplicationRecord
  belongs_to :word, required: false
end
