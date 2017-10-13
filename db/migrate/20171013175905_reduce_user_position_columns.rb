class ReduceUserPositionColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :adm
    remove_column :users, :director
    remove_column :users, :manager
    remove_column :users, :staff

    add_column :users, :chart_level, :integer
  end
end
