class UpdateEmployersUpdateForeignKey < ActiveRecord::Migration
  def change
    add_reference :employers, :students, index: true
  end
end
