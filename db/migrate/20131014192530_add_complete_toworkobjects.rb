class AddCompleteToworkobjects < ActiveRecord::Migration
  def change
    add_column :workobjects, :complete, :integer
  end

end
