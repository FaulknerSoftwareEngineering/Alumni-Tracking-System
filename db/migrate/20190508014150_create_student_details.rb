class CreateStudentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :student_details do |t|
      t.string :sex
      t.string :maritalStatus
      t.boolean :usCitizen
      t.string :citizenship
      t.string :ethnicity
      t.string :race
      t.boolean :athlete
      t.date :dateOfBirth
      t.string :primaryEmail
      t.boolean :deceased
      t.string :churchType
      t.boolean :graduated
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :preferredName
      t.string :title
      t.string :suffix
      t.string :level
			t.belongs_to :student, index: true
			t.integer :student_id

      t.timestamps null: false
    end
		add_index :student_details, :student_id if !index_exists?(:student_details, :student_id)
		add_foreign_key :student_details, :students
	
  end
  
  def down
		remove_index :student_details, :student_id
    remove_foreign_key :student_details, :students
  end
	
end
