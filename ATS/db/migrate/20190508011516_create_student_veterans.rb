class CreateStudentVeterans < ActiveRecord::Migration
  def change
    create_table :student_veterans do |t|
		t.boolean :veteran
		t.string :chapter
		t.integer{2} :percent
		t.timestamps null: false
    end
  end
end
