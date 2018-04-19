class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :colleges_visible
      #Is the college multi-select visible upon creating a user with this role
      t.boolean :departments_visible
      #Is the department multi-select visible upon creating a user with this role
      t.timestamps null: false
    end
  end
end
