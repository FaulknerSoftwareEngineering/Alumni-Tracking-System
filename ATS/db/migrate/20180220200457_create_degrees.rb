class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :type
      t.string :name
      #t.string :college - Should this be here? Since degree -> department -> college?
      t.belongs_to :department, index: true
      t.integer :department_id
      t.timestamps
    end
    
    add_index :degrees, :department_id if !index_exists?(:degrees, :department_id)
    add_foreign_key :degrees, :departments
  end
end
