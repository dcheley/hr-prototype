class RemoveBadgeColours < ActiveRecord::Migration[5.0]
  def change
    remove_column :badges, :red
    remove_column :badges, :yellow
    remove_column :badges, :purple
    remove_column :badges, :blue
    remove_column :badges, :green
    remove_column :badges, :pink
    remove_column :badges, :grey
  end
end
