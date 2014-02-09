class AddColumSummaFinances < ActiveRecord::Migration
  def up
    add_column :finances, :summa, :float
  end

  def down
  end
end
