class CreateStudentTuitions < ActiveRecord::Migration[5.2]
  def change
    create_table :student_tuitions do |t|
		t.boolean :tuitionAssistance
		t.string :source
		t.belongs_to :student, index: true
		t.integer :student_id
		t.timestamps null: false
    end
	
		add_index :student_tuitions, :student_id if !index_exists?(:student_tuitions, :student_id)
    add_foreign_key :student_tuitions, :students
	
  end
  
  def down
    remove_index :student_tuitions, :student_id
    remove_foreign_key :student_tuitions, :students
  end
  
end
