class ReworkSeveralColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :service_management_and_facilities
    remove_column :users, :strategic_human_resources
    remove_column :users, :business_planning_and_finance
    remove_column :users, :adm_office
    remove_column :signups, :current_step

    add_column :users, :office, :integer
    add_column :signups, :current_step, :integer
  end
end
