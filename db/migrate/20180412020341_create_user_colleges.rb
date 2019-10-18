class CreateUserColleges < ActiveRecord::Migration
  def change
    create_table :user_colleges do |t|
      t.belongs_to :user, index: true
      t.integer :user_id
      t.belongs_to :college, index: true
      t.integer :college_id
      t.timestamps null: false
    end
  end
end
