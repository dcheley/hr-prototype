class MoveColumnsFromRecognitionsToBadges < ActiveRecord::Migration[5.0]
  def change
      remove_column :recognitions, :receiver_id, :integer
      remove_column :recognitions, :recognizer_id, :integer

      add_column :badges, :receiver_id, :integer
      add_column :badges, :recognizer_id, :integer
  end
end
