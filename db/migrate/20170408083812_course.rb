class Course < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.timestamps null: false
    end

    add_reference :activities, :course, foreign_key: true, index: true
    add_reference :parses, :course, foreign_key: true, index: true
    add_index :activities, [:school_id, :course_id, :name], unique: true
    add_index :activities, :name
  end
end
