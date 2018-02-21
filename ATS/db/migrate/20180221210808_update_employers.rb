class UpdateEmployers < ActiveRecord::Migration
  def change
    add_column 'employers', 'name', 'string'
    add_column 'employers', 'created_at', 'datetime'
    add_column 'employers', 'updated_at', 'datetime'
  end
end
