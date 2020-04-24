class AddIrbFlagToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :irb_user, :boolean
  end
end
