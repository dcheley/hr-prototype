class AddTeamColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :team_1, :integer
    add_column :users, :team_2, :integer
    add_column :users, :team_3, :integer
    add_column :users, :team_4, :integer
  end
end
