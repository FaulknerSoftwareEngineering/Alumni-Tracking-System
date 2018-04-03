=begin 
  Created by:Javan Rampersad, Christopher Smith
  On: February 20, 2018
=end

class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :number
      #t.string :compensation
      t.string :email
      t.timestamps null: false
    end
  end
end
