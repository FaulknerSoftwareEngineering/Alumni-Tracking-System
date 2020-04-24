class AddGraduatedToGradSchool < ActiveRecord::Migration[5.1]
  def change
        add_column :grad_schools, :graduated, :boolean
  end
end
