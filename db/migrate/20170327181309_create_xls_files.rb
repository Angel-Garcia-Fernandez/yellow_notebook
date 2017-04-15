class CreateXlsFiles < ActiveRecord::Migration
  def change
    create_table :xls_files do |t|
      t.timestamps null: false
    end

    create_table :parses do |t|
      t.text :output
      t.integer :status, limit: 4, default: 0, null: false
      t.datetime :csv_conversion_started_at
      t.datetime :csv_conversion_ended_at
      t.text :parsed_csv
      t.datetime :parsing_started_at
      t.datetime :parsing_ended_at
      t.timestamps null: false
    end

    add_reference :parses, :xls_file, foreign_key: true, index: true

  end
end
