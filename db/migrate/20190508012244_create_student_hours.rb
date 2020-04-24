class CreateStudentHours < ActiveRecord::Migration[5.2]
  def change
    create_table :student_hours do |t|
			t.string :program
      t.decimal :jslHoursAttempted
      t.decimal :jslHoursCompleted
      t.decimal :jslQualityHours
      t.decimal :jslQualityPoints
      t.string :doctorateMajor
      t.decimal :gradHoursAttempted
      t.decimal :gradHoursCompleted
      t.decimal :gradQualityHours
      t.decimal :gradQualityPoints
      t.boolean :transient
      t.boolean :transfer
      t.decimal :undergradTransferQualityHours
      t.decimal :undergradTransferQualityPoints
      t.decimal :undergradSemesterHoursAttempted
      t.decimal :undergradSemesterHoursCompleted
			t.decimal :undergradQualityHours
      t.decimal :undergradQualityPoints
      t.integer :currentHours
			t.belongs_to :student, index: true
			t.integer :student_id
      t.date :expectedDegreeDate

      t.timestamps null: false
    end
	
		add_index :student_hours, :student_id if !index_exists?(:student_hours, :student_id)
    add_foreign_key :student_hours, :students
  
  end
  
  def down
    remove_index :student_hours, :student_id
    remove_foreign_key :student_hours, :students
  end
  
end
