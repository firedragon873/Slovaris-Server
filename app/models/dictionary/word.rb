class Dictionary::Word < ApplicationRecord
  include Concerns::Language

  belongs_to :dictionary, required: false
  has_many :syllables, class_name: "Dictionary::Syllable", dependent: :destroy
  has_many :translates, class_name: "Dictionary::Translate", dependent: :destroy
  accepts_nested_attributes_for :translates, allow_destroy: true

  has_attached_file :image, styles: { mini: '100x100>', small: '300x300>', medium: '320x320>', large: '640x640>' },
                           url: '/system/images/:id/:style/:basename.:extension',
                           path: ':rails_root/public/system/images/:id/:style/:basename.:extension'
  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png) }
end
