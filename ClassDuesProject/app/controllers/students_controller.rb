class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action {authorize self}

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @user = current_user
    @year = params[:year]
  end
  def payDues
    @student = Student.find(params[:id])
    authorize self
  end
  def import
      @file = params[:file]
      @classOf = GraduatingClass.find(params[:graduating_class_id])
      @gID = @classOf.id
      @gY = @classOf.gradYear
      Student.import(@file, @gID)
      redirect_to graduating_classes_url
  end
  def file
    authorize self
    @student = Student.new
    @classOf = GraduatingClass.find(params[:gcID])
  end
  def updateDues
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update(dues_params)
        format.html { redirect_to calculateDues_students_url(:id => @student.id), notice: 'Dues were successfully paid.', method: 'patch' }
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
      RecieptsMailer.sendReciept(@student.id,current_user).deliver_now
      redirect_to student_url(:id => @student.id)
    else
      redirect_to @student, notice: 'Dues could not be paid at this time...'
    end
  end
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    authorize self
  end

  # GET /students/1/edit
  def edit
    authorize self
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
    authorize self
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
      params.require(:student).permit( :graduation_classes_id, :firstName, :lastName, :studentID, :balance, :paidBalance, :email)
    end
    def dues_params
      params.permit( :graduation_classes_id, :firstName, :lastName, :studentID, :balance, :paidBalance, :email)
    end
end
