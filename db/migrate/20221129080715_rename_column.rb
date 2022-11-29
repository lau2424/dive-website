class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :centent, :content
  end
end
