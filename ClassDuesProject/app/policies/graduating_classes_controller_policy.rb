class GraduatingClassesControllerPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def new?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
  def delete?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
end
