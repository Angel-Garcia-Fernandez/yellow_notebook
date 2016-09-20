class CreateStudentClassData < ActiveRecord::Migration
  def change
    create_table :student_class_data do |t|
      t.boolean :attended
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
