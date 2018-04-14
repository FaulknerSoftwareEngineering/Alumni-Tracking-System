class AddDetailsToGradSchools < ActiveRecord::Migration
  def change
    add_column :grad_schools, :university_id, :integer
    add_index :grad_schools, :university_id if !index_exists?(:grad_schools, :university_id)
    add_foreign_key :grad_schools, :universities
  end
end
