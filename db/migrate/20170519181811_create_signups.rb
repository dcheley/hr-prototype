class CreateSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :signups do |t|
      t.boolean :step_one
      t.boolean :step_two
      t.boolean :step_three
      t.boolean :step_four
      t.boolean :step_five
      t.boolean :step_six

      t.timestamps
    end
  end
end
