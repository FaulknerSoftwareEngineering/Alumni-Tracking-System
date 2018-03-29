class CreateEarnedDegrees < ActiveRecord::Migration
  def change
    create_table :earned_degrees do |t|
      t.string :season
      t.string :year_graduated
      t.belongs_to :student, index: true
      t.integer :student_id
      t.belongs_to :degree, index: true
      t.integer :degree_id
      t.timestamps null: false
    end
    
    add_index :earned_degrees, :student_id if !index_exists?(:earned_degrees, :student_id)
    add_foreign_key :degree, :students
    
    add_index :earned_degrees, :degree_id if !index_exists?(:earned_degrees, :degree_id)
    add_foreign_key :earned_degrees, :degrees
  end
  
  def down
    remove_index :earned_degrees, :student_id
    remove_foreign_key :earned_degrees, :forms
    
    remove_index :earned_degrees, :degree_id
    remove_foreign_key :earned_degrees, :degrees
  end
end
