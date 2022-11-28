class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude
      t.string :facility
      t.string :equipment
      t.string :difficulty

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
