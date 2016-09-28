class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|

      t.string :NIC, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :surname, null: false, default: ''

      t.string :phone_number

      t.string :address
      t.string :town
      t.string :province
      t.string :zip_code

      t.timestamps null: false
    end

    # add_reference :guardians, :student, index: true, null: false
    # add_foreign_key :guardians, :students

  end
end
