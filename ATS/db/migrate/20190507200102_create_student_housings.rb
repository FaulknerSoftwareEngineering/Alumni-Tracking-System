class CreateStudentHousings < ActiveRecord::Migration
  def change
    create_table :student_housings do |t|
		t.string :campus
		t.string :program
		t.string :housingType
		t.string :housingID
		t.string :roomNumber
		t.string :mealPlan
		t.timestamps null: false
    end
	
		add_index :student_housings, :student_id if !index_exists?(:student_housings, :student_id)
    add_foreign_key :student_housings, :students
	
  end
  
  def down
    remove_index :student_housings, :student_id
    remove_foreign_key :student_housings, :students
  end
  
end
