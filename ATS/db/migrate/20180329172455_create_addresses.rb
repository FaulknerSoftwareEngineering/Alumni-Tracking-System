class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :cell_number
      t.string :work_number
      t.string :home_number
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
