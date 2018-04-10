class ChangeTypeInDegreesToDegreeType < ActiveRecord::Migration
  def change
    rename_column :degrees, :type, :degree_type
  end
end
