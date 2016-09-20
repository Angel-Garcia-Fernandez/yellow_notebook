class CreateActivityClasses < ActiveRecord::Migration
  def change
    create_table :activity_classes do |t|
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps null: false
    end
  end
end
