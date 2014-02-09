class DelPassEmailStaff < ActiveRecord::Migration
  def up
    remove_column :staffs, :password, :string
  end

  def down
  end
end
