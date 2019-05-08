class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :current
      t.date :effective
      t.string :firstYear
      t.string :firstTermUndergrad
      t.string :attendanceUndergrad
      t.boolean :termOfficalUndergrad
      t.string :firstTermGraduate
      t.string :attendanceGraduate
      t.boolean :termOfficialGraduate

      t.timestamps null: false
		end
		
		add_index :attendances, :student_id if !index_exists?(:student_tuitions, :student_id)
    add_foreign_key :attendances, :students
		
  end
	
  
  def down
		remove_index :attendances, :student_id
    remove_foreign_key :attendances, :students
  end
end
