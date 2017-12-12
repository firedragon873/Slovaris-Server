class AddPositionToTranslates < ActiveRecord::Migration[5.0]
  def change
    add_column :dictionary_translates, :position, :integer
  end
end
