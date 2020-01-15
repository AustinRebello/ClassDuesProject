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
    edit?
  end
  def delete?
    edit?
  end
  def update?
    edit?
  end
  def create?
    edit?
  end
  def destroy?
    edit?
  end
end
