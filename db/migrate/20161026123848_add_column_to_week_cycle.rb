class AddColumnToWeekCycle < ActiveRecord::Migration
  def change
    add_column :time_week_cycles, :week_day, :integer, limit: 1
  end
end
