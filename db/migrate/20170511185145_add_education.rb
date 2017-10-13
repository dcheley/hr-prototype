class AddEducation < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :education, :boolean
    add_column :badges, :exp, :boolean
  end
end
