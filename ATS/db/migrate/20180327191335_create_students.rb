class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :primary_email
      t.string :secondary_email
      t.string :cell_number
      t.string :work_number
      t.string :home_number
      t.boolean :tracked
      t.timestamps null: false
    end
  end
end
