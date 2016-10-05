class RemoveCodeFieldFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :code, :string, null: false
  end
end
