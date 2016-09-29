class AddDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :details, :text
  end
end
