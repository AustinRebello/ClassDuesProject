class UsersController < ApplicationController
before_action  :authenticate_user!
before_action {authorize self}
  def index
    @users = User.order(:email)
    @roles = Role.all
    authorize self
  end

  def updateRoles
    @user = User.find(params[:user_id])
    @roles = params[:role]
    @user.roles = []
    @roles.each do |r|
      @role = Role.find(r)
      @user.roles << @role
    end
    authorize self
    redirect_to users_index_url
  end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_index_path, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
