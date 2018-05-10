class CreateSection1s < ActiveRecord::Migration
  def change
    create_table :section1s do |t|
      t.string :project_name
      t.string :approval_type
      t.text :expedited_or_exempt_review_just
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
    
    add_index :section1s, :form_id if !index_exists?(:section1s, :form_id)
    add_foreign_key :section1s, :forms
  end
  
  def down
    remove_index :section1s, :form_id
    remove_foreign_key :section1s, :forms
  end
end
