class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|

      t.string :name, default: ""
      t.string :surname, default: ""
      t.string :NIC

      t.decimal :default_discount, precision: 5, scale: 4, default: 0.0, null: false
      t.integer :default_payment_type_eid, default: 0, null: false

      t.string :scholar_phone_number
      t.string :phone_number

      t.string :address
      t.string :town
      t.string :province
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
