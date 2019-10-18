class CreateSection5s < ActiveRecord::Migration
  def change
    create_table :section5s do |t|
      t.text :sources_of_funding
      t.text :researcher_competency
      t.text :irb_comments
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
    
    add_index :section5s, :form_id if !index_exists?(:section5s, :form_id)
    add_foreign_key :section5s, :forms
  end
  
  def down
    remove_index :section5s, :form_id
    remove_foreign_key :section5s, :forms
  end
end
