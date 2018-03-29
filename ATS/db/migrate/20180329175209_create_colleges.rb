class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :college_dean
      t.timestamps null: false
    end
  end
end
