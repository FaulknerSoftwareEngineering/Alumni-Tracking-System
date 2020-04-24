class UpdateEmployersUpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :employers, :students, index: true
  end
end
