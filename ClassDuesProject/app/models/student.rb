class Student < ApplicationRecord
  validates :studentID, uniqueness: true
  belongs_to :graduating_class
  require 'csv'
  def self.import(f,gID)
    csv_text = File.read(f.path)
    csv = CSV.parse(csv_text)
    csv.each do |row|
      newStud=Student.new
      newStud.graduating_class_id=gID
      newStud.studentID=row[0]
      newStud.firstName=row[1]
      newStud.lastName=row[2]
      newStud.email=row[3]
      newStud.balance=100
      newStud.paidBalance=0
      newStud.save

      end
  end
end
