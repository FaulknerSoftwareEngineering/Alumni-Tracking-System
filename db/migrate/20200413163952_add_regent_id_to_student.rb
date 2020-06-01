class AddRegentIdToStudent < ActiveRecord::Migration[5.2]
  def change
      add_column 'students', 'regent_id', :integer 
  end
end
