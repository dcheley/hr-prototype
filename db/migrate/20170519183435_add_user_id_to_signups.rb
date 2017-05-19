class AddUserIdToSignups < ActiveRecord::Migration[5.0]
  def change
    add_column :signups, :user_id, :integer
  end
end
