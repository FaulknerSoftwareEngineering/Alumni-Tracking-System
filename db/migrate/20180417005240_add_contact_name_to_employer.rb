class AddContactNameToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :contact_name, :string
  end
end
