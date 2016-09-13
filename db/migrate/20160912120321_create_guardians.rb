class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :NIC
      t.string :name
      t.string :surname
      t.string :phone_number
      t.string :address
      t.string :town
      t.string :province
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
