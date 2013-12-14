class RenameColUpload < ActiveRecord::Migration
  def up
    rename_column :uploads, :task_id, :workobject_id
  end

  def down
  end
end
