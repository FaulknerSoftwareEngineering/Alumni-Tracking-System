class CreateSection4animals < ActiveRecord::Migration
  def change
    create_table :section4animals do |t|
      
      t.text :what_data
      t.text :location_organization_data_collection
      t.text :procedures_of_data_collection
      t.text :period_of_data_collection
      t.text :data_collection_instruments
      t.text :data_stored_how
      t.text :length_of_data_retention
      t.text :who_has_data_access
      t.text :analysis_methods
      t.text :results_desseminated
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
    
    add_index :section4animals, :form_id if !index_exists?(:section4animals, :form_id)
    add_foreign_key :section4animals, :forms
  end
  
  def down
    remove_index :section4animals, :form_id
    remove_foreign_key :section4animals, :forms
  end
end
