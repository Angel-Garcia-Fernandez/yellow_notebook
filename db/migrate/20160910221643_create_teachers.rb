class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, default: ""
      t.string :surname, default: ""
      t.string :work_email, default: ""
      t.string :NIC

      t.string :mobile_phone_number
      t.string :phone_number

      t.string :address
      t.string :town
      t.string :province
      t.string :zip_code

      t.string :IBAN, length: 75

      t.attachment :photo

      t.boolean :default_collection_management, default: false, null: false
      t.boolean :default_attendance_management, default: false, null: false

      t.text :studies

      t.text :details

      t.timestamps null: false
    end

    add_index :teachers, [ :name, :surname ]

    # add_reference :teachers, :user, index: true
    # add_foreign_key :teachers, :users

  end
end
