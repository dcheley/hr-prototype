class AddColumnstoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :title, :string
    add_column :users, :phone, :string
    add_column :users, :adm, :boolean
    add_column :users, :director, :boolean
    add_column :users, :manager, :boolean
    add_column :users, :human_resources, :boolean
    add_column :users, :finance, :boolean
  end
end
