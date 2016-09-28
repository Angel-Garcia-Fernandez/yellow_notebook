class CreateActivityClasses < ActiveRecord::Migration
  def change
    create_table :activity_classes do |t|

      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false

      t.timestamps null: false
    end

    # add_reference :activity_classes, :activity, index: true, null: false
    # add_foreign_key :activity_classes, :activities

  end
end
