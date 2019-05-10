class CreateHighSchools < ActiveRecord::Migration
  def change
    create_table :high_schools do |t|
      t.string :ceebHS
      t.string :nameHS
      t.string :typeHS
      t.string :gpaHS
      t.integer :percentageHS, limit: 2
      t.integer :rankHS, limit: 2
      t.integer :sizeHS, limit: 2
      t.string :gradYearHS
			t.belongs_to :student, index: true
			t.integer :student_id

      t.timestamps null: false
    end
		add_index :high_schools, :student_id if !index_exists?(:high_schools, :student_id)
		add_foreign_key :high_schools, :students
	
  end
  
  def down
		remove_index :high_schools, :student_id
    remove_foreign_key :high_schools, :students
  end
  
end
