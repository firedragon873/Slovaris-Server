class Dictionary::Dictionary < ApplicationRecord
  include Concerns::Language

  belongs_to :user
  has_many :words, class_name: "Dictionary::Word"
end
