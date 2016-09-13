class CreateAccountDetails < ActiveRecord::Migration
  def change
    create_table :account_details do |t|
      t.string :IBAN

      t.timestamps null: false
    end
  end
end
