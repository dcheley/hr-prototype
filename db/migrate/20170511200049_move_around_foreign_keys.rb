class MoveAroundForeignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_column :badges, :receiver_id
    remove_column :badges, :recognizer_id
    remove_column :badges, :recognition_id

    add_column :recognitions, :receiver_id, :integer
    add_column :recognitions, :recognizer_id, :integer
    add_column :recognitions, :recognition_id, :integer
  end
end
