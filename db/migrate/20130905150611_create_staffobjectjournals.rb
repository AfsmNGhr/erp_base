class CreateStaffobjectjournals < ActiveRecord::Migration
  def change
    create_table :staffobjectjournals do |t|
      t.date :edate
      t.date :sdate
      t.integer :staff_id
      t.integer :workobject_id

      t.timestamps
    end
  end
end
