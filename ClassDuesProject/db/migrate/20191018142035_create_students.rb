class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :gradYear
      t.integer :studentID
      t.text :firstName
      t.text :lastName
      t.integer :balance
      t.integer :paidBalance
      t.timestamps
    end
  end
end
