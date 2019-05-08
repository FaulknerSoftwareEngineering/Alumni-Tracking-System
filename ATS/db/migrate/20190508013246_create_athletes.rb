class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.boolean :baseball
      t.boolean :basketball
      t.boolean :cheerleader
      t.boolean :football
      t.boolean :golf
      t.boolean :soccer
      t.boolean :softball
      t.boolean :volleyball

      t.timestamps null: false
    end
  end
end
