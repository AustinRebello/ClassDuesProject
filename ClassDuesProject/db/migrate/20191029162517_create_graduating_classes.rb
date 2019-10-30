class CreateGraduatingClasses < ActiveRecord::Migration[5.2]
  validates :gradYear, uniqueness: true
  def change
    create_table :graduating_classes do |t|
      t.integer :gradYear
      t.string :classAdvisorOne
      t.string :classAdvisorTwo

      t.timestamps
    end
  end
end
