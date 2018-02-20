class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string 'name'
      t.timestamps
    end
  end
end
