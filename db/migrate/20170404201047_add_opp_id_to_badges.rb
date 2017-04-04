class AddOppIdToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :opportunity_id, :integer
  end
end
