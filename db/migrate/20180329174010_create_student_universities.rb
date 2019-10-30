class CreateStudentUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :student_universities, id: false do |t|
      t.belongs_to :student
      t.belongs_to :university
      t.timestamps
    end
  end
end
