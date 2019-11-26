class RecieptsMailer < ApplicationMailer

  def sendReciept(studentID, cr)
    @student = Student.find(studentID)
    mail(from: cr.email, to: @student.email, subject: "Class Dues")
  end
end
