class CreateHighSchools < ActiveRecord::Migration
  def change
    create_table :high_schools do |t|
      t.string :ceebHS
      t.string :nameHS
      t.string :typeHS
      t.string :gpaHS
      t.integer :percentageHS, limit: 2
      t.integer :rankHS, limit: 2
      t.integer :sizeHS, limit: 2
      t.string :gradYearHS

      t.timestamps null: false
    end
  end
end
