class AddLoginToStaffs < ActiveRecord::Migration
  def change
    add_index :staffs, :login, :unique => true
  end
end
