class CreateStaffTaskJournals < ActiveRecord::Migration
  def change
    create_table :staff_task_journals do |t|
      t.integer :staff_id, :null => false
      t.integer :task_id, :null => false
      t.date :sdate
      t.date :edate

      t.timestamps
    end
  end
end
