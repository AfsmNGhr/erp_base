class AddStaffTask < ActiveRecord::Migration
  def change
    add_column :tasks, :staff_id, :integer, :null => false
    add_column :tasks, :staff_from_id, :integer, :null => false
  end
end
