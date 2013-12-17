class AddCompleteToworkobjects < ActiveRecord::Migration
  def change
    add_column :workobjects, :complete, :integer, :null => false
  end

end
