class AddConstraintsToStudentActivitySignUps < ActiveRecord::Migration
  def up
    change_column_default :student_activity_sign_ups, :payment_type_eid, 0
    change_column_default :student_activity_sign_ups, :activity_discount, 0.0
    change_column_null :student_activity_sign_ups, :payment_type_eid, false
    change_column_null :student_activity_sign_ups, :activity_discount, false
  end

  def down
    change_column_default :student_activity_sign_ups, :payment_type_eid, nil
    change_column_default :student_activity_sign_ups, :activity_discount, nil
    change_column_null :student_activity_sign_ups, :payment_type_eid, true
    change_column_null :student_activity_sign_ups, :activity_discount, true
  end
end
