class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.boolean :human
      t.timestamps null: false
    end
  end
end
