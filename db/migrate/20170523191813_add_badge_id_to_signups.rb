class AddBadgeIdToSignups < ActiveRecord::Migration[5.0]
  def change
    add_column :signups, :badge_id, :integer
  end
end
