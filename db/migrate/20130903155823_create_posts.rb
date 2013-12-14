class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.integer :staff_id
      t.integer :task_id

      t.timestamps
    end
  end
end
