class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :position
      t.date :birthday
      t.string :passport
      t.string :skill

      t.timestamps
    end
  end
end
