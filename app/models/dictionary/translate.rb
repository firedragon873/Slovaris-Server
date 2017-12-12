class Dictionary::Translate < ApplicationRecord
  include Concerns::Language

  belongs_to :word, required: false
end
