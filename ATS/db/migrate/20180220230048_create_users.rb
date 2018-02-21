class CreateUsers < ActiveRecord::Migration
  #Ethan Widen 2/20/18
  def change
    create_table :users do |t|
      t.string 'email'
      t.string 'first_name'
      t.string 'last_name'
      t.string 'user_image'
      t.integer 'google_id'
      t.timestamps null: false
    end
  end
end
