class AddSecondLinkToOpps < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :second_link, :string
  end
end
