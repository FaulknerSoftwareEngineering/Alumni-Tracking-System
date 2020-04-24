class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :streetAddressOne
      t.string :streetAddressTwo
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :countryID
      t.string :originCountryID
      t.string :originState
      t.string :originCountyID
      t.belongs_to :student, index: true
      t.integer :student_id
      t.timestamps null: false
    end
    
    add_index :addresses, :student_id if !index_exists?(:addresses, :student_id)
    add_foreign_key :addresses, :students
  end
  
  def down
    remove_index :addresses, :student_id
    remove_foreign_key :addresses, :students
  end
end
