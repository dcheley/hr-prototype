class ChangeSatisfactionColumnType < ActiveRecord::Migration[5.0]
  def change
    remove_column :signups, :satisfaction, :string
  end
end
