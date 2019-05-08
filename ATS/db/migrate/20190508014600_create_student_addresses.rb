class CreateStudentAddresses < ActiveRecord::Migration
  def change
    create_table :student_addresses do |t|
      t.string :streetAddressOne
      t.string :streetAddressTwo
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :countryID
      t.string :originCountryID
      t.string :originState
      t.string :originCountyID

      t.timestamps null: false
    end
  end
end
