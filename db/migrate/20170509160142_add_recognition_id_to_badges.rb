class AddRecognitionIdToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :recognition_id, :integer
  end
end
