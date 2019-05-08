class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :majorType
      t.string :majorFullName
      t.string :advisor
      t.string :majorShortName
      t.string :assocMajor
      t.string :undergradMajorOne
      t.string :undergradMajorTwo
      t.string :undergradMajorThree
      t.string :undergradMinorOne
      t.string :undergradMinorTwo
      t.string :graduateMajor

      t.timestamps null: false
    end
  end
end
