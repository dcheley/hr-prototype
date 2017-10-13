class AddSkillstoOpps < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :skills, :string
  end
end
