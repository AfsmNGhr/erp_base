class CreateTaskDelegates < ActiveRecord::Migration
  def change
    create_table :task_delegates do |t|
      t.integer :task_id, :null => false
      t.integer :staff_from
      t.integer :staff_to
      t.timestamp :when

      t.timestamps
    end
  end
end
