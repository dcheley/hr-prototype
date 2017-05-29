class AddSatisfactionColumnToPulse < ActiveRecord::Migration[5.0]
  def change
    add_column :pulse_surveys, :satisfaction, :float
  end
end
