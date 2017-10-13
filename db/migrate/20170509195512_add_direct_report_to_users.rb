class AddDirectReportToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :direct_report, :string
  end
end
