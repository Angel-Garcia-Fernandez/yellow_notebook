class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :NIC
      t.string :name
      t.string :surname
      t.decimal :default_discount, precision: 5, scale: 4
      t.integer :default_payment_type_eid
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
