class AddColPost < ActiveRecord::Migration
  def up
    add_column :posts, :workobject, :integer
  end

  def down
  end
end
