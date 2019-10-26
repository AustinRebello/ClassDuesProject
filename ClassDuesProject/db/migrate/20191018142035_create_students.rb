class CreateStudents < ActiveRecord::Migration[5.2]
  attr_accessor :paidBalance
  def change
    create_table :students do |t|
      t.integer :gradYear
      t.integer :studentID
      t.text :firstName
      t.text :lastName
      t.integer :balance

      t.timestamps
    end
  end
end
