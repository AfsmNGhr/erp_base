class AddCol2Obj < ActiveRecord::Migration
  def up
    add_column :workobjects, :region, :string
    add_column :workobjects, :staff_id, :integer
    add_column :staffobjectjournals, :status, :string
    add_column :staffs, :login, :string
    add_column :staffs, :password, :string
    add_column :staffs, :email, :string
    add_column :staffs, :phone1, :string
    add_column :staffs, :phone2, :string
  end

  def down
  end
end
