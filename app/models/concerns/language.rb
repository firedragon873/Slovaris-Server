module Concerns::Language
  extend ActiveSupport::Concern

  included do

    enum language: [:english]

  end

end
