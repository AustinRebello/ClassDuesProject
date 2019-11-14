class RolesControllerPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.roles.include?(Role.where(title: "Administrator").take)
  end
end
