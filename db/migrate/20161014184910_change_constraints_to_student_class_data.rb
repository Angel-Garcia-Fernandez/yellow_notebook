class ChangeConstraintsToStudentClassData < ActiveRecord::Migration
  def up
    #think it twice
    change_column_default :student_class_data, :attended, nil
    change_column_null :student_class_data, :attended, false
    change_column_null :student_class_data, :paid, false
  end

  def down
    change_column_default :student_class_data, :attended, false
    change_column_null :student_class_data, :attended, true
    change_column_null :student_class_data, :paid, true
  end
end
