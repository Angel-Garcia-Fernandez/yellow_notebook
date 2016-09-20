class CreateStudentActivitySignUps < ActiveRecord::Migration
  def change
    create_table :student_activity_sign_ups do |t|
      t.decimal :activity_discount, precision: 5, scale: 4
      t.date :started_at
      t.date :ended_at
      t.integer :payment_type_eid

      t.timestamps null: false
    end
  end
end
