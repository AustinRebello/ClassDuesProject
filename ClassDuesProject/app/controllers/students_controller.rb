class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end
  def payDues
    @student = Student.find(params[:id])
  end
  def import
      @file = params[:file]
      @classOf = GraduatingClass.find(params[:graduating_class_id])
      @gID = @classOf.id
      @gY = @classOf.gradYear
      Student.import(@file, @gID, @gY)
      redirect_to graduating_classes_url
  end
  def file
    @student = Student.new
    @classOf = GraduatingClass.find(params[:gcID])
  end
  def updateDues
    @student = Student.find(params[:id])
    puts "Paid B"
    puts params
    respond_to do |format|
      if @student.update(dues_params)
        format.html { redirect_to calculateDues_students_url(:id => @student.id), notice: 'Student was successfully updated.', method: 'patch' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :payDues}
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
      puts @student.errors.full_messages
    end
  end
  def calculateDues
    @student= Student.find(params[:id])
    @student.balance = @student.balance - @student.paidBalance
    if @student.save
      redirect_to students_url(:id => @student.id)
    else
      render calculateDues_students_url method: :post
    end
  end
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:gradYear, :graduation_classes_id, :firstName, :lastName, :studentID, :balance, :paidBalance)
    end
    def dues_params
      params.permit(:gradYear, :graduation_classes_id, :firstName, :lastName, :studentID, :balance, :paidBalance)
    end
end
