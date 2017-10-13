class RemoveRecognitionId < ActiveRecord::Migration[5.0]
  def change
    remove_column :recognitions, :recognition_id
  end
end
