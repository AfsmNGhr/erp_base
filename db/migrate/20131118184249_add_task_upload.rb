class AddTaskUpload < ActiveRecord::Migration
  def up
    add_column :uploads, :task_id, :integer
  end

  def down
  end
end
