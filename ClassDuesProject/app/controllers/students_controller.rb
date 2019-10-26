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

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

  end
end
