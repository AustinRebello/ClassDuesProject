class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :student_id
      t.string :firstName
      t.string :lastName
      t.string :dateAccepted
      t.string :recievedFrom
      t.integer :paidBalance
      t.timestamps
    end
  end
end
