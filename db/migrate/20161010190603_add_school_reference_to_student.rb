class AddSchoolReferenceToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :school, index: true, null: true
    add_foreign_key :students, :schools
  end
end
