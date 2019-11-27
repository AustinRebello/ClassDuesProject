class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :graduating_class_id
      t.string :firstName
      t.string :lastName
      t.integer :studentID
      t.integer :balance
      t.integer :paidBalance
      t.string :email

      t.timestamps
    end
  end
end
