class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def import
    Student.import(params[:file])
    redirect_to grades_url
  end

  def file

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
    params.require(:student).permit(:gradYear, :studentID, :firstName, :lastName, :balance)
  end
end
