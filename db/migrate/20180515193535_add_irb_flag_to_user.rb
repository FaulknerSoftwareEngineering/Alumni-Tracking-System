class AddIrbFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :irb_user, :boolean
  end
end
