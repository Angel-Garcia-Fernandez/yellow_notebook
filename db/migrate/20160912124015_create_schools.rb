class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|

      t.string :name, null: false, default: ''

      t.string :address
      t.string :town
      t.string :province
      t.string :zip_code

      t.string :email
      t.string :phone

      t.timestamps null: false
    end

    # # added here but it is in activities
    # add_reference :activities, :school, index: true
    # add_foreign_key :activities, :schools

  end
end
