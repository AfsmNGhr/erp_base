class RenameColPost < ActiveRecord::Migration
  def up
    rename_column :posts, :workobject, :workobject_id
  end

  def down
  end
end
