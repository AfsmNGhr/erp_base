class AddStatToWo < ActiveRecord::Migration
  def change
    add_column :workobjects, :status, :string
  end
end
