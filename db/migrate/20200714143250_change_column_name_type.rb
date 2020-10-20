class ChangeColumnNameType < ActiveRecord::Migration[5.2]
  def change
      change_table :earned_degrees do |t|
          t.rename :type, :degreeType
      end          
  end
end
