class ChangeUserOrgChartBooleans < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :human_resources, :adm_office
    rename_column :users, :finance, :strategic_human_resources

    add_column :users, :service_management_and_facilities, :boolean
    add_column :users, :business_planning_and_finance, :boolean
  end
end
