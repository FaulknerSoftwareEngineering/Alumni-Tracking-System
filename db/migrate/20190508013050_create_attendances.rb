class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :current
      t.string :effective
      t.string :firstYear
      t.string :firstTermUndergrad
      t.string :attendanceUndergrad
      t.boolean :termOfficalUndergrad
      t.string :firstTermGraduate
      t.string :attendanceGraduate
      t.boolean :termOfficialGraduate
			t.belongs_to :student, index: true
			t.integer :student_id

      t.timestamps null: false
		end
		
		add_index :attendances, :student_id if !index_exists?(:attendances, :student_id)
    add_foreign_key :attendances, :students
		
  end
	
  
  def down
		remove_index :attendances, :student_id
    remove_foreign_key :attendances, :students
  end
end
