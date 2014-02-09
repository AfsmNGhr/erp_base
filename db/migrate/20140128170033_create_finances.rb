class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.integer :workobject_id
      t.integer :staff_id
      t.string :cost_type
      t.string :fin_item
      t.string :staff_item

      t.timestamps
    end
  end
end
