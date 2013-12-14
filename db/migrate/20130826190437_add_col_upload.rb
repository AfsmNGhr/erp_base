class AddColUpload < ActiveRecord::Migration
  def up
    add_column :uploads, :state, :string
    add_column :uploads, :staff, :integer
  end

  def down
  end
end
