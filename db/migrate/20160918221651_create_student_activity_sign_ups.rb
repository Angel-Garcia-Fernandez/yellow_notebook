class CreateStudentActivitySignUps < ActiveRecord::Migration
  def change
    create_table :student_activity_sign_ups do |t|

      t.decimal :activity_discount, precision: 5, scale: 4

      t.date :started_at
      t.date :ended_at

      t.integer :payment_type_eid

      t.timestamps null: false
    end

    # add_reference :student_activity_sign_ups, :activity, index: true, null: false
    # add_foreign_key :student_activity_sign_ups, :activities
    #
    # add_reference :student_activity_sign_ups, :student, index: true, null: false
    # add_foreign_key :student_activity_sign_ups, :students
    #
    # # added here but it is in student_class_data
    # add_reference :student_class_data, :student_activity_sign_up, index: true, null: false
    # add_foreign_key :student_class_data, :student_activity_sign_ups

  end
end
