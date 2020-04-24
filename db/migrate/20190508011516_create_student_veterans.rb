class CreateStudentVeterans < ActiveRecord::Migration[5.2]
  def change
    create_table :student_veterans do |t|
		t.boolean :veteran
		t.string :chapter
		t.integer :percent, limit: 2
		t.belongs_to :student, index: true
		t.integer :student_id
		t.timestamps null: false
    end
		add_index :student_veterans, :student_id if !index_exists?(:student_veterans, :student_id)
		add_foreign_key :student_veterans, :students
	
  end
  
  def down
		remove_index :student_veterans, :student_id
    remove_foreign_key :student_veterans, :students
  end

end
