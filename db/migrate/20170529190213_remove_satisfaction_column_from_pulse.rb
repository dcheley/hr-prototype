class RemoveSatisfactionColumnFromPulse < ActiveRecord::Migration[5.0]
  def change
    remove_column :pulse_surveys, :satisfaction, :float
  end
end
