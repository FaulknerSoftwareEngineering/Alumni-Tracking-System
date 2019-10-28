class CreateDegreeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :degree_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
