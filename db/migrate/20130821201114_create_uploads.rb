class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.integer :size
      t.integer :task_id

      t.timestamps
    end
  end
end
