class CreateUserDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_departments do |t|
      t.belongs_to :user, index: true
      t.integer :user_id
      t.belongs_to :department, index: true
      t.integer :department_id
      t.timestamps null: false
    end
  end
end
