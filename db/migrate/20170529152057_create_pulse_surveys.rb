class CreatePulseSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :pulse_surveys do |t|
      t.string :feedback

      t.timestamps
    end
  end
end
