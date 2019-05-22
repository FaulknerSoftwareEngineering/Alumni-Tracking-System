class CreateGradSchools < ActiveRecord::Migration
  def change
    create_table :grad_schools do |t|
      t.boolean :applied
      t.boolean :accepted
      t.string :status
      t.string :higher_degree_type
      t.string :higher_degree_name
      t.belongs_to :student, index: true
      t.integer :student_id
      t.integer :university_id
      t.timestamps null: false
    end
    
    add_index :grad_schools, :student_id if !index_exists?(:grad_schools, :student_id)
    add_foreign_key :grad_schools, :students
    add_index :grad_schools, :university_id if !index_exists?(:grad_schools, :university_id)
    add_foreign_key :grad_schools, :universities
  end
  
  def down
    remove_index :grad_schools, :student_id
    remove_foreign_key :grad_schools, :students
    remove_index :grad_schools, :university_id
    remove_foreign_key :grad_schools, :universities
  end
end
