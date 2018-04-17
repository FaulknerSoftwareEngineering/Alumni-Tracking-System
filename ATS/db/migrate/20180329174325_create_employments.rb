class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :job_title
      t.boolean :current_job
      t.boolean :in_field
      t.date :start_date
      t.date :end_date
      t.belongs_to :employer, index: true
      t.integer :employer_id
      t.belongs_to :student, index: true
      t.integer :student_id
      t.timestamps null: false
    end
    add_index :employments, :employer_id if !index_exists?(:employments, :employer_id)
    add_foreign_key :employments, :employers
    
    add_index :employments, :student_id if !index_exists?(:employments, :student_id)
    add_foreign_key :employments, :students
  end
  
  def down
    remove_index :employments, :employer_id
    remove_foreign_key :employments, :employers
    
     remove_index :employments, :student_id
    remove_foreign_key :employments, :students
  end
end
