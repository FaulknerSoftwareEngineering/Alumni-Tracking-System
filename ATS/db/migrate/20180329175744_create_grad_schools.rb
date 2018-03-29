class CreateGradSchools < ActiveRecord::Migration
  def change
    create_table :grad_schools do |t|
      t.boolean :applied
      t.boolean :accepted
      t.string :status
      t.belongs_to :student, index: true
      t.integer :student_id
      t.timestamps null: false
    end
    
    add_index :grad_schools, :student_id if !index_exists?(:grad_schools, :student_id)
    add_foreign_key :grad_schools, :students
  end
  
  def down
    remove_index :grad_schools, :student_id
    remove_foreign_key :grad_schools, :students
  end
end
