class CreateStandardizedTests < ActiveRecord::Migration
  def change
    create_table :standardized_tests do |t|
      t.integer :convertedACT, limit: 1
      t.integer :compositeACT, limit: 1
      t.boolean :officialACT
      t.integer :englishACT, limit: 1
      t.integer :mathACT, limit: 1
      t.integer :socialACT, limit: 1
      t.integer :naturalACT, limit: 1
      t.integer :toefl, limit: 2
      t.integer :gre, limit: 2
      t.integer :gmat, limit: 2
      t.integer :mat, limit: 2
      t.integer :lsat, limit: 2
      t.integer :compositeSAT, limit: 2
      t.boolean :officialSAT
      t.integer :mathSAT, limit: 2
      t.integer :readingSAT, limit: 2
      t.integer :writingSAT, limit: 2
			t.belongs_to :student, index: true
			t.integer :student_id

      t.timestamps null: false
    end
		
		add_index :standardized_tests, :student_id if !index_exists?(:standardized_tests, :student_id)
    add_foreign_key :standardized_tests, :students
	
  end
  
  def down
    remove_index :standardized_tests, :student_id
    remove_foreign_key :standardized_tests, :students
  end
	
end
