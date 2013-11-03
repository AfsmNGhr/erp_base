class CreateWorkobjects < ActiveRecord::Migration
  def change
    create_table :workobjects do |t|
      t.string :name
      t.string :city
      t.string :latitude
      t.string :longtitude
      t.string :address

      t.timestamps
    end
  end
end
