class AddAdminStaffs < ActiveRecord::Migration
  def up
    add_column :staffs, :admin, :boolean, :default => false
  end

  def down
  end
end
