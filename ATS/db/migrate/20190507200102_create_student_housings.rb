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
  end
end
