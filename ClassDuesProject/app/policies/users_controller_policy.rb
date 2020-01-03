class UsersControllerPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take))
  end
  def updateRoles?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take))
  end
  def destroy?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
end
