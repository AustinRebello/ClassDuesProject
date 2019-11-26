class GraduatingClassesControllerPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end
  def show?
    true
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
  def update?
    edit?
  end
  def create?
    new?
  end
  def destroy?
    delete?
  end
end
