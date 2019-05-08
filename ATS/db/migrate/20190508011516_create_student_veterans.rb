class CreateStudentVeterans < ActiveRecord::Migration
  def change
    create_table :student_veterans do |t|
		t.boolean :veteran
		t.string :chapter
		t.integer :percent, limit: 2
		t.timestamps null: false
    end
  end
end
