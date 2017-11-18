class UserGroup < ApplicationRecord
  belongs_to :user

  validates :name,       presence: true
  validates :group_type, presence: true
  enum group_type: {
                    pupil_group:   0,
                    teacher_group: 1,
                    parent_group:  2
                   }
end
