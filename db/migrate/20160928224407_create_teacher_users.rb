class CreateTeacherUsers < ActiveRecord::Migration
  def change

    remove_foreign_key :teachers, :users
    remove_reference :teachers, :user, index: true

    create_table :teacher_users do |t|

      t.references

      t.timestamps null: false
    end

    add_reference :teacher_users, :user, index: true
    add_foreign_key :teacher_users, :users

    add_reference :teacher_users, :teacher, index: true
    add_foreign_key :teacher_users, :teachers

  end
end
