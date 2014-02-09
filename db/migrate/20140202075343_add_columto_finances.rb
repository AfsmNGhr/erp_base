class AddColumtoFinances < ActiveRecord::Migration
  def up
     add_column :finances, :d1, :date
     add_column :finances, :d2, :date
     add_column :finances, :remark, :text
     add_column :finances, :invoice, :string
  end

  def down
  end
end
