class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :town
      t.string :province
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
