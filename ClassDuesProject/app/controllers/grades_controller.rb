class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to file_students_url
    else
      render new_grade_url
    end
  end

  def show
    @grade = Grade.find(params[:id])
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    @grade.update(grade_params)
    if @grade.save
      redirect_to grades_url
    else
      render grade_url method: :post
    end
  end

  def delete
    @grade = Grade.find(params[:id])
  end

  def destroy
    @grade = Grade.find(params[:id])
    @students = Student.where(:gradYear => @grade.gradYear)
    @students.each do |s|
      s.destroy
    end
    @grade.destroy

    redirect_to grades_url
  end
  private
  def grade_params
    params.require(:grade).permit(:gradYear, :classAdvisorOne, :classAdvisorTwo)
  end
end
