class ChangeConstraintsToStudentClassData < ActiveRecord::Migration
  def up
    change_column_default :student_class_data, :attended, nil
    change_column_default :student_class_data, :paid, nil
  end

  def down
    change_column_default :student_class_data, :attended, false
    change_column_default :student_class_data, :paid, false
  end
end
