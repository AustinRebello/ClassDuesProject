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
end
