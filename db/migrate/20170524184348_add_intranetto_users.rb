class AddIntranettoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :intranet, :boolean
  end
end
