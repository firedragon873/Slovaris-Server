class Dictionary::Dictionary < ApplicationRecord
  include Concerns::Language

  belongs_to :user
  has_many :words, class_name: "Dictionary::Word", dependent: :destroy
  accepts_nested_attributes_for :words, allow_destroy: true
end
