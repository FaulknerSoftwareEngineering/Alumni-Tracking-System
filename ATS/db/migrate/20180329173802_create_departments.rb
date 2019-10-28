class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.belongs_to :college, index: true
      t.integer :college_id
      t.timestamps null: false
    end
    add_index :departments, :college_id if !index_exists?(:departments, :college_id)
    add_foreign_key :departments, :colleges
  end
  
  def down
    remove_index :departments, :college_id
    remove_foreign_key :departments, :colleges
  end
end
