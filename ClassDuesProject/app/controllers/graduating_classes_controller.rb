class GraduatingClassesController < ApplicationController
  before_action :set_graduating_class, only: [:show, :edit, :update, :destroy]

  # GET /graduating_classes
  # GET /graduating_classes.json
  def index
    @graduating_classes = GraduatingClass.all
  end

  # GET /graduating_classes/1
  # GET /graduating_classes/1.json
  def show
  end

  # GET /graduating_classes/new
  def new
    @graduating_class = GraduatingClass.new
  end

  # GET /graduating_classes/1/edit
  def edit
  end
  def delete
    @graduating_class = GraduatingClass.find(params[:id])
  end

  # POST /graduating_classes
  # POST /graduating_classes.json
  def create
    @graduating_class = GraduatingClass.new(graduating_class_params)

    respond_to do |format|
      if @graduating_class.save
        format.html { redirect_to file_students_url(:gcID => @graduating_class.id), notice: 'Graduating class was successfully created.' }
        format.json { render :show, status: :created, location: @graduating_class }
      else
        format.html { render :new }
        format.json { render json: @graduating_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduating_classes/1
  # PATCH/PUT /graduating_classes/1.json
  def update
    respond_to do |format|
      if @graduating_class.update(graduating_class_params)
        format.html { redirect_to @graduating_class, notice: 'Graduating class was successfully updated.' }
        format.json { render :show, status: :ok, location: @graduating_class }
      else
        format.html { render :edit }
        format.json { render json: @graduating_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduating_classes/1
  # DELETE /graduating_classes/1.json
  def destroy
    @graduating_class.destroy
    @graduating_class.students.destroy
    respond_to do |format|
      format.html { redirect_to graduating_classes_url, notice: 'Graduating class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduating_class
      @graduating_class = GraduatingClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduating_class_params
      params.require(:graduating_class).permit(:gradYear, :classAdvisorOne, :classAdvisorTwo)
    end
end
