class CreateAccountDetails < ActiveRecord::Migration
  def change
    create_table :account_details do |t|
      t.string :IBAN, length: 75

      t.boolean :default_account, null: false, default: true

      t.timestamps null: false
    end

    # add_reference :account_details, :guardian, index: true
    # add_foreign_key :account_details, :guardians
    #
    # add_reference :account_details, :student, index: true, null: false
    # add_foreign_key :account_details, :students

  end
end
