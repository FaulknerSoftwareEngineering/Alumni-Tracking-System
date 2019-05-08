class CreateStudentTuitions < ActiveRecord::Migration
  def change
    create_table :student_tuitions do |t|
		t.boolean :tuitionAssistance
		t.string :source
		t.timestamps null: false
    end
  end
end
