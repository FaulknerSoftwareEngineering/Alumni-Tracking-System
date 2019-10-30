class CreateDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :degrees do |t|
      t.string :name
      t.belongs_to :department, index: true
      t.integer :department_id
      t.belongs_to :degree_type, index: true
      t.integer :degree_type_id
      t.timestamps
    end
    
    add_index :degrees, :department_id if !index_exists?(:degrees, :department_id)
    add_foreign_key :degrees, :departments
    add_index :degrees, :degree_type_id if !index_exists?(:degrees, :degree_type_id)
    add_foreign_key :degrees, :degree_types
  end
end
