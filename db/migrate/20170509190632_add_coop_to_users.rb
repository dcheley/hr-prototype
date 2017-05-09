class AddCoopToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :co_op, :boolean
  end
end
