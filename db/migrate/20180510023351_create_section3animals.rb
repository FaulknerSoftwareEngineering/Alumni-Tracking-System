class CreateSection3animals < ActiveRecord::Migration
  def change
    create_table :section3animals do |t|

      t.string :describe_animals
      t.string :housing_and_transport
      t.string :ethical_care_in_altered_conditions
      t.string :protect_humans
      t.string :justification_for_animals
      t.string :foreseen_pain
      t.string :animals_after_study
      t.string :veterinarian_present
      t.string :other_helpful_info
      t.belongs_to :form, index: true
      t.integer :form_id
      t.timestamps null: false
    end
      add_index :section3animals, :form_id if !index_exists?(:section3animals, :form_id)
      add_foreign_key :section3animals, :forms
  end
    
  def down
    remove_index :section3animals, :form_id
    remove_foreign_key :section3animals, :forms
  end
end
