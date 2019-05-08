class CreateStudentTuitions < ActiveRecord::Migration
  def change
    create_table :student_tuitions do |t|
		t.boolean :tuitionAssistance
		t.string :source
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
