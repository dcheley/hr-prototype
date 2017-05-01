class CreateRecognitions < ActiveRecord::Migration[5.0]
  def change
    create_table :recognitions do |t|
      t.string :name
      t.string :description
      t.integer :receiver_id
      t.integer :recognizer_id

      t.timestamps
    end
  end
end
