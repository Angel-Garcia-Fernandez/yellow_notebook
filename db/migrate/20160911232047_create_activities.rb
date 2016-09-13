class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false
      t.string :classification
      t.date :started_at
      t.date :ended_at
      t.decimal :default_price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
