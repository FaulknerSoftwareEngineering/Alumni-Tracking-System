class CreateResearchers < ActiveRecord::Migration
  def change
    create_table :researchers do |t|
      t.text :name
      t.text :position
      t.text :email
      t.text :phone
      t.text :department
      t.text :researcher_type
      t.text :investigator_type
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
    
    add_index :researchers, :form_id if !index_exists?(:researchers, :form_id)
    add_foreign_key :researchers, :forms
  end
  
  def down
    remove_index :researchers, :form_id
    remove_foreign_key :researchers, :forms
  end
end
