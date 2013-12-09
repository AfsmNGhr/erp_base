class AddStaffTask < ActiveRecord::Migration
  def change
    add_column :tasks, :staff_id, :integer
    add_column :tasks, :staff_from_id, :integer
  end
end
