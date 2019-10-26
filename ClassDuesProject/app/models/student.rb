class Student < ApplicationRecord
  require 'csv'
  def self.import(file)
      csv_text = File.read(file.path)
      csv = CSV.parse(csv_text)
      csv.each do |row|
        newStud=Student.new
        newStud.gradYear=row[0]
        newStud.studentID=row[1]
        newStud.firstName=row[2]
        newStud.lastName=row[3]
        newStud.balance=100
        newStud.save
      end
  end
end
