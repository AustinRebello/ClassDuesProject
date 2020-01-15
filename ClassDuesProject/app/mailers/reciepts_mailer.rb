class RecieptsMailer < ApplicationMailer

  def sendReciept(studentID, cr)
    @student = Student.find(studentID)
    mail(from: cr.email, to: @student.email, subject: "Class Dues")
  end
  def remind(students, cr)
    students.each do |s|
      if cr.graduationYear = s.graduating_class.gradYear && s.balance > 0
        @student=Student.find(s.id)
        mail(from: cr.email, to: @student.email, subject: "Class Dues Reminder")
      end
    end
  end
end
