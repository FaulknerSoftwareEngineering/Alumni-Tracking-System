class CreateHelpRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :help_requests do |t|
      t.string :email
      t.text   :message
      t.timestamps null: false
    end
  end
end
