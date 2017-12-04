module Concerns::Displayable
  extend ActiveSupport::Concern

  included do

    def display_name
      if self.class.column_names.include?("name")
        "#{self.class.model_name.human} #{self.name}"
      else
        "#{self.class.model_name.human} №#{self.id}"
      end
    end

  end

end
