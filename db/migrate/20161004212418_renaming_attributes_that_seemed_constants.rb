class RenamingAttributesThatSeemedConstants < ActiveRecord::Migration
  def change
    rename_column :guardians, :NIC, :nic
    rename_column :teachers, :NIC, :nic
    rename_column :students, :NIC, :nic
    rename_column :teachers, :IBAN, :iban
    rename_column :account_details, :IBAN, :iban
  end
end
