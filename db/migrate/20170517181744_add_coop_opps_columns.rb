class AddCoopOppsColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :bonus, :string
    add_column :opportunities, :link, :string
  end
end
