class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.string  :name
      t.integer :group_type
      t.text    :description
      t.timestamps
    end

    UserGroup.create(name: "Ученик",   group_type: 'pupil_group')
    UserGroup.create(name: "Учитель",  group_type: 'teacher_group')
    UserGroup.create(name: "Родитель", group_type: 'parent_group')
  end
end
