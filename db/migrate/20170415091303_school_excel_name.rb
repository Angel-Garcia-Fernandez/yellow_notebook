class SchoolExcelName < ActiveRecord::Migration
  def change
    create_table :school_excel_names do |t|
      t.string :name, null: false
      t.index :name
      t.timestamps null: false
    end

    add_reference :school_excel_names, :school, foreign_key: true, index: true
  end
end
