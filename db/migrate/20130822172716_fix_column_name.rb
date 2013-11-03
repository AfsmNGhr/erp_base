class FixColumnName < ActiveRecord::Migration
  def up
      rename_column :uploads, :name, :filename
  end

  def down
  end
end
