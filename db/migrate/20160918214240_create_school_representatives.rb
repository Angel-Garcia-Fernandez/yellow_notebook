class CreateSchoolRepresentatives < ActiveRecord::Migration
  def change
    create_table :school_representatives do |t|
      t.string :name
      t.string :position
      t.text :details

      t.timestamps null: false
    end
  end
end
