class CreatePaymentcashes < ActiveRecord::Migration
  def change
    create_table :paymentcashes do |t|
      t.date :when
      t.integer :staff_id, :null => false
      t.float :how_many

      t.timestamps
    end
  end
end
