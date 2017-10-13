class AdjustTeamColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :team_1, :team

    remove_column :users, :team_2
    remove_column :users, :team_3
    remove_column :users, :team_4
  end
end
