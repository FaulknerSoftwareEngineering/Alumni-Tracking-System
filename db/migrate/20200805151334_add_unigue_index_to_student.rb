class AddUnigueIndexToStudent < ActiveRecord::Migration[5.2]
  def change
     remove_index :students, :student_id
     add_index :students, :student_id, unique: true 
  end
end
