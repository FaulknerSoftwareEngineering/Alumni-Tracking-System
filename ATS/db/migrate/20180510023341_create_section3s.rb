class CreateSection3s < ActiveRecord::Migration
  def change
    create_table :section3s do |t|
      t.text :intended_population_characteristics
      t.string :students_or_employees_recruited
      t.integer :min_participants
      t.integer :max_participants
      t.text :vulnerable_groups
      t.text :vulnerable_groups_other
      t.text :vulnerable_rationale
      t.text :protections_in_place
      t.text :descr_of_all_risk
      t.text :descr_of_comp
      t.text :descr_selection_proc
      t.text :assure_informed_consent
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
    
    add_index :section3s, :form_id if !index_exists?(:section3s, :form_id)
    add_foreign_key :section3s, :forms
  end
  
  def down
    remove_index :section3s, :form_id
    remove_foreign_key :section3s, :forms
  end
  
end
