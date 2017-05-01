class AddJobDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :feedback, :job_description
  end
end
