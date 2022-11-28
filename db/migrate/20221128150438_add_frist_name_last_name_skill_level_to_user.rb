class AddFristNameLastNameSkillLevelToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :skill_level, :string
  end
end
