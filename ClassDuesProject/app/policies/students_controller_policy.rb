class StudentsControllerPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take))
  end
  def new?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take))
  end
  def delete?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take))
  end
  def payDues?
    (@user.roles.include?(Role.where(title: "Administrator").take) || @user.roles.include?(Role.where(title: "Class Advisor").take) || @user.roles.include?(Role.where(title: "Class Treasurer").take))
  end
  def file?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
end
