class AddContactNameToEmployer < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :contact_name, :string
  end
end
