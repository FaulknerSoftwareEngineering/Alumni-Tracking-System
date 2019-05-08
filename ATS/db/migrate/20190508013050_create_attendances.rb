class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :current
      t.date :effective
      t.string :firstYear
      t.string :firstTermUndergrad
      t.string :attendanceUndergrad
      t.boolean :termOfficalUndergrad
      t.string :firstTermGraduate
      t.string :attendanceGraduate
      t.boolean :termOfficialGraduate

      t.timestamps null: false
    end
  end
end
