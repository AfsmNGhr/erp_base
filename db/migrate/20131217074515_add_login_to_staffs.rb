class AddLoginToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :login, :string
    add_index :staffs, :login, :unique => true
  end
end
