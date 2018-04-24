class CreateContactSupports < ActiveRecord::Migration
  def change
    create_table :contact_supports do |t|
      t.string :email
      t.text   :message
      t.timestamps null: false
    end
  end
end
