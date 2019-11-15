class RolesControllerPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def edit?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def update?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def show?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def new?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def create?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def destroy?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end

end
