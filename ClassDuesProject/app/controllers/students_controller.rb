class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def import
    Student.import(params[:file],params[:graduating_class_id],params[:gradYear])
    redirect_to graduating_classes_url
  end

  def file
    @student = Student.new
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_url
    else
      render new_student_url
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end
  def payDues
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.save
      redirect_to students_url
    else
      render student_url method: :post
    end
  end
  def updateDues
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.save
      redirect_to calculateDues_students_url(:id => @student.id)
    else
      render updateDues_students_url method: :post
    end
  end
  def calculateDues
    @student= Student.find(params[:id])
    @student.balance = @student.balance - @student.paidBalance
    if @student.save
      redirect_to students_url
    else
      render calculateDues_students_url method: :post
    end
  end
  def delete
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url
  end
  def findStudent
    @foundStudent = Student.where(studentID: params[:studentID]).take!
    redirect_to student_url(@foundStudent.id)
  end
  private
  def student_params
    params.require(:student).permit(:gradYear, :studentID, :firstName, :lastName, :balance, :paidBalance)
  end
  def create_params
    params.permit(:file,:graduating_class_id,:gradYear)
  end

end
