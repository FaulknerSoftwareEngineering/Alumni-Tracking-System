class CreateMajors < ActiveRecord::Migration[5.2]
  def change
    create_table :majors do |t|
      t.string :majorType
      t.string :majorFullName
      t.string :advisor
      t.string :majorShortName
      t.string :assocMajor
      t.string :undergradMajorOne
      t.string :undergradMajorTwo
      t.string :undergradMajorThree
      t.string :undergradMinorOne
      t.string :undergradMinorTwo
      t.string :graduateMajor
			t.belongs_to :student, index: true
			t.integer :student_id

      t.timestamps null: false
    end
		add_index :majors, :student_id if !index_exists?(:majors, :student_id)
		add_foreign_key :majors, :students
	
  end
  
  def down
		remove_index :majors, :student_id
    remove_foreign_key :majors, :students
  end
  
end