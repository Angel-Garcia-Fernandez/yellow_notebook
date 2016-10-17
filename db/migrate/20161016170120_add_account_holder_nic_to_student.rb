class AddAccountHolderNicToStudent < ActiveRecord::Migration
  def change
    add_column :students, :account_holder_nic, :string
  end
end
