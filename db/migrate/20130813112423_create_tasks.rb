class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :workobject_id
      t.text :description
      t.date :sdate
      t.date :edate
      t.integer :progress
      t.string :state

      t.timestamps
    end
  end
end
