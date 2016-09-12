class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, default: ""
      t.string :surname, default: ""
      t.boolean :manage_attendance_default, default: false, null: false
      t.boolean :manage_collection_default, default: false, null: false
      t.text :details

      t.timestamps null: false
    end

    add_index :teachers, [ :name, :surname ]

  end
end
