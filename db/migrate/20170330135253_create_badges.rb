class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.boolean :red
      t.boolean :blue
      t.boolean :yellow
      t.boolean :green
      t.boolean :purple
      t.boolean :pink
      t.boolean :grey

      t.timestamps
    end
  end
end
