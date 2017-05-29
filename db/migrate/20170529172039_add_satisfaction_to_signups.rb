class AddSatisfactionToSignups < ActiveRecord::Migration[5.0]
  def change
    add_column :signups, :satisfaction, :string
  end
end
