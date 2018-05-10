class CreateSection2s < ActiveRecord::Migration
  def change
    create_table :section2s do |t|
      t.text :abstract_summary
      t.text :purpose
      t.text :content_area
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
    
    add_index :section2s, :form_id if !index_exists?(:section2s, :form_id)
    add_foreign_key :section2s, :forms
  end
  
  def down
    remove_index :section2s, :form_id
    remove_foreign_key :section2s, :forms
  end
end
