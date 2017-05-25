class AddCreatorIdToOpps < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :creator_id, :integer
  end
end
