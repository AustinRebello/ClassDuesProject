class StudentsControllerPolicy < ApplicationPolicy
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
     @user.roles.include?(Role.where(title: "Class Advisor").take)
  end
  def update?
    edit?
  end
  def create?
    new?
  end
  def destroy?
    edit?
  end
  def new?
     edit?
  end
  def delete?
    edit?
  end

  def import?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end

  def payDues?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take) || @user.roles.include?(Role.where(title: "Class Treasurer").take))
  end
  def updateDues?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take) || @user.roles.include?(Role.where(title: "Class Treasurer").take))
  end
  def calculateDues?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take) || @user.roles.include?(Role.where(title: "Class Treasurer").take))
  end

  def file?
    @user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take) || @user.roles.include?(Role.where(title: "Class Treasurer").take)
  end
def email?
  @user.roles.include?(Role.where(title: "Class Advisor").take)
end

end
