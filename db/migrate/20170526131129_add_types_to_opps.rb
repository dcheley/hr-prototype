class AddTypesToOpps < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :learning, :boolean
    add_column :opportunities, :career, :boolean
    add_column :opportunities, :hobby, :boolean
  end
end
