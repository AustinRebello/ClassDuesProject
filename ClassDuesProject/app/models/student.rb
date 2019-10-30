class Student < ApplicationRecord
  belongs_to :graduating_classes
  require 'csv'
  def self.import(file,class_id,gradYear)
    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text)
    csv.each do |row|
      #newStud=Student.new
      #newStud.gradYear=gradYear
      #newStud.graduating_class_id=class_id
      #newStud.studentID=row[1]
      #newStud.firstName=row[2]
    #  newStud.lastName=row[3]
      #newStud.balance=100
      #newStud.paidBalance=0
      #newStud.save
      puts gradYear
      puts class_id
      puts row[1]
      end
  end
end
