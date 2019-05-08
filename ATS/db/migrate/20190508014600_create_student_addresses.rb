class CreateStudentAddresses < ActiveRecord::Migration
  def change
    create_table :student_addresses do |t|
      t.string :streetAddressOne
      t.string :streetAddressTwo
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :countryID
      t.string :originCountryID
      t.string :originState
      t.string :originCountyID

      t.timestamps null: false
    end
		add_index :student_addresses, :student_id if !index_exists?(:student_remedials, :student_id)
		add_foreign_key :student_addresses, :students
	
  end
  
  def down
		remove_index :student_addresses, :student_id
    remove_foreign_key :student_addresses, :students
  end

end