class AddFeedbackToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :feedback, :string
  end
end
