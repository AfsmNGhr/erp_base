class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.integer :size
      t.integer :task_id, :null => false

      t.timestamps
    end
  end
end
