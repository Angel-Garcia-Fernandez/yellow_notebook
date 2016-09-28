class CreateTimeWeekCycles < ActiveRecord::Migration
  def change
    create_table :time_week_cycles do |t|
      t.datetime :activity_class_starts_at, null: false
      t.datetime :activity_class_ends_at, null: false
      t.date :period_started_at
      t.date :period_ended_at

      t.timestamps null: false
    end

    # add_reference :time_week_cycles, :activity, index: true, null: false
    # add_foreign_key :time_week_cycles, :activities

  end
end
