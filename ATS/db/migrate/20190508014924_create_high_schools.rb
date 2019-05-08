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

      t.timestamps null: false
    end
		add_index :high_schools, :student_id if !index_exists?(:student_remedials, :student_id)
		add_foreign_key :high_schools, :students
	
  end
  
  def down
		remove_index :high_schools, :student_id
    remove_foreign_key :high_schools, :students
  end
  
end
