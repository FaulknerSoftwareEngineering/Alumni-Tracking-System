class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.boolean :human
      t.timestamps null: false
    end
  end
end
