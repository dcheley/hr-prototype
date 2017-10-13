class ReduceSignupColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :signups, :step_six
    remove_column :signups, :step_five
    remove_column :signups, :step_four
    remove_column :signups, :step_three
    remove_column :signups, :step_two

    rename_column :signups, :step_one, :current_step
  end
end
