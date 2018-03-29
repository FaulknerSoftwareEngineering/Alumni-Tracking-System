class CreateUsers < ActiveRecord::Migration
  #Ethan Widen 2/20/18
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :user_image
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.integer :role_id
      t.integer :google_id
      t.timestamps null: false
    end
    
    add_index :users, :role_id if !index_exists?(:users, :role_id)
    add_foreign_key :users, :role_id
  end
  
  def down
    remove_index :users, :role_id
    remove_foreign_key :users, :role_id
  end
end
