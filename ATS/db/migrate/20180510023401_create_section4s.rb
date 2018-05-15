class CreateSection4s < ActiveRecord::Migration
  def change
    create_table :section4s do |t|
      t.text :data_collection_proc
      t.text :location_organization_data_collection
      t.text :data_to_be_collected
      t.text :period_of_data_collection
      t.text :prospective_or_retrospective
      t.text :anonymous_data
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
    
    add_index :section4s, :form_id if !index_exists?(:section4s, :form_id)
    add_foreign_key :section4s, :forms
  end
  
  def down
    remove_index :section4s, :form_id
    remove_foreign_key :section4s, :forms
  end
end
