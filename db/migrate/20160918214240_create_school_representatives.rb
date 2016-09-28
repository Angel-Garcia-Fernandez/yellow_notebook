class CreateSchoolRepresentatives < ActiveRecord::Migration
  def change
    create_table :school_representatives do |t|

      t.string :full_name, null: false, default: ""
      t.string :position
      t.text :details

      t.timestamps null: false
    end

    # add_reference :school_representatives, :school, index: true, null: false
    # add_foreign_key :school_representatives, :schools

  end
end
