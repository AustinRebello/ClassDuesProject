class Student < ApplicationRecord
  belongs_to :graduating_class
  require 'csv'
  def self.import(f,gID,gY)
    csv_text = File.read(f.path)
    csv = CSV.parse(csv_text)
    csv.each do |row|
      puts gY
      puts gID
      puts row[1]
      puts row[2]
      puts row[3]
      puts "B R E A K"
      newStud=Student.new
      newStud.gradYear=gY
      newStud.graduating_class_id=gID
      newStud.studentID=row[1]
      newStud.firstName=row[2]
      newStud.lastName=row[3]
      newStud.balance=100
      newStud.paidBalance=0
      puts "Foreign Key: #{newStud.graduating_class_id}"
      newStud.save

      end
  end
end
