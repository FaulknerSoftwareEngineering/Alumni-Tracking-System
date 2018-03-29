class AddStudentReferenceToDegrees < ActiveRecord::Migration
  def self.up
    change_table :degrees do |t|
      t.references 'student'
    end
  end
end
