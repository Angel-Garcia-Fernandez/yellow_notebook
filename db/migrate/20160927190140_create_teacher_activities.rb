class CreateTeacherActivities < ActiveRecord::Migration
  def change
    create_table :teacher_activities do |t|

      t.boolean :attendance_management, null: false, default: false
      t.boolean :collection_management, null: false, default: false
      t.boolean :teacher_in_charge, null: false, default: true

      t.timestamps null: false
    end

    # add_reference :teacher_activities, :activity, index: true, null: false
    # add_foreign_key :teacher_activities, :activities
    #
    # add_reference :teacher_activities, :teacher, index: true, null: false
    # add_foreign_key :teacher_activities, :teachers

  end
end
