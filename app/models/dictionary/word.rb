class Dictionary::Word < ApplicationRecord
  include Concerns::Language

  belongs_to :dictionary
  has_many :syllables, class_name: "Dictionary::Syllable"
  has_many :translates, class_name: "Dictionary::Translate"

  has_attached_file :image, styles: { mini: '100x100>', small: '300x300>', medium: '320x320>', large: '640x640>' },
                           url: '/system/images/:id/:style/:basename.:extension',
                           path: ':rails_root/public/system/images/:id/:style/:basename.:extension'
  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png) }
end
