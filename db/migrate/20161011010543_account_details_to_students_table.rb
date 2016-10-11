class AccountDetailsToStudentsTable < ActiveRecord::Migration
  def change

    remove_foreign_key :account_details, :students
    remove_reference :account_details, :student, index: true, null: false

    remove_foreign_key :account_details, :guardians
    remove_reference :account_details, :guardian, index: true


    drop_table :account_details do |t|
      t.string :iban, length: 75

      t.boolean :default_account, null: false, default: true

      t.timestamps null: false
    end

    add_column :students, :iban, :string, length: 75
    add_column :students, :account_holder, :string

  end
end
