class AddGraduatedToGradSchool < ActiveRecord::Migration
  def change
        add_column :grad_schools, :graduated, :boolean
  end
end
