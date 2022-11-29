class RenameColumnInSpots < ActiveRecord::Migration[7.0]
  def change
    rename_column :spots, :equipment, :category
  end
end
