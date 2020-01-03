class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action {authorize self}

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
    authorize self
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new

  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create

    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update

  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:title)
    end
end
