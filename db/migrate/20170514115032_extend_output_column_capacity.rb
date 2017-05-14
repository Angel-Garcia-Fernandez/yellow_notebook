class ExtendOutputColumnCapacity < ActiveRecord::Migration
  def up
    change_column :parses, :output, :text, limit: 16777215
  end
  def down
    change_column :parses, :output, :text, limit: 65535
  end
end
