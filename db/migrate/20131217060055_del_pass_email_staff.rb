class DelPassEmailStaff < ActiveRecord::Migration
  def up
    remove_column :staffs, :password, :string
    remove_column :staffs, :login, :string
  end

  def down
  end
end
