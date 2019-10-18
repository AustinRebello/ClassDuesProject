class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :gradYear
      t.text :classAdvisorOne
      t.text :classAdvisorTwo

      t.timestamps
    end
  end
end
