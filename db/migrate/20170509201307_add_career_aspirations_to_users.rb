class AddCareerAspirationsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :career_aspirations, :string
  end
end
