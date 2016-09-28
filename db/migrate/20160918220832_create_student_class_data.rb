class CreateStudentClassData < ActiveRecord::Migration
  def change
    create_table :student_class_data do |t|
      t.boolean :attended, default: false
      t.boolean :paid, default: false

      t.timestamps null: false
    end

    # add_reference :student_class_data, :activity_class, index: true, null: false
    # add_foreign_key :student_class_data, :activity_classes
    #
    # # add_reference :student_class_data, :student_activity_sign_up, index: true, null: false
    # # add_foreign_key :student_class_data, :student_activity_sign_ups

  end
end
