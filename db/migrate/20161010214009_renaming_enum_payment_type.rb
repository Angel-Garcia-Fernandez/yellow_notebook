class RenamingEnumPaymentType < ActiveRecord::Migration
  def change
    rename_column :student_activity_sign_ups, :payment_type_eid, :payment_type
    rename_column :students, :default_payment_type_eid, :default_payment_type
  end
end
