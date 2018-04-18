class AddEndDateToEmployments < ActiveRecord::Migration
  def change
    add_column :employments, :end_date, :date
  end
end
