class CreateStudentRemedials < ActiveRecord::Migration
  def change
    create_table :student_remedials do |t|
		t.boolean :remedial0301
		t.boolean :remedial0302
		t.boolean :remedial0305
		t.boolean :remedial1335
		t.boolean :remedial1300
		t.timestamps null: false
    end
  end
end
