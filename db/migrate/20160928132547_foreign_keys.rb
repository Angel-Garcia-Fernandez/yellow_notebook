class ForeignKeys < ActiveRecord::Migration
  def change

    add_reference :teachers, :user, index: true
    add_foreign_key :teachers, :users

    add_reference :guardians, :student, index: true, null: false
    add_foreign_key :guardians, :students

    add_reference :account_details, :guardian, index: true
    add_foreign_key :account_details, :guardians

    add_reference :account_details, :student, index: true, null: false
    add_foreign_key :account_details, :students

    # added here but it is in activities
    add_reference :activities, :school, index: true
    add_foreign_key :activities, :schools

    add_reference :school_representatives, :school, index: true, null: false
    add_foreign_key :school_representatives, :schools

    add_reference :activity_classes, :activity, index: true, null: false
    add_foreign_key :activity_classes, :activities

    add_reference :student_class_data, :activity_class, index: true, null: false
    add_foreign_key :student_class_data, :activity_classes

    add_reference :student_activity_sign_ups, :activity, index: true, null: false
    add_foreign_key :student_activity_sign_ups, :activities

    add_reference :student_activity_sign_ups, :student, index: true, null: false
    add_foreign_key :student_activity_sign_ups, :students

    # added here but it is in student_class_data
    add_reference :student_class_data, :student_activity_sign_up, index: true, null: false
    add_foreign_key :student_class_data, :student_activity_sign_ups

    add_reference :teacher_activities, :activity, index: true, null: false
    add_foreign_key :teacher_activities, :activities

    add_reference :teacher_activities, :teacher, index: true, null: false
    add_foreign_key :teacher_activities, :teachers

    add_reference :time_week_cycles, :activity, index: true, null: false
    add_foreign_key :time_week_cycles, :activities

  end
end
