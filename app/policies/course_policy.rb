class CoursePolicy < ApplicationPolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end

  def create?
    user.admin? if user
  end

  def update?
    user.admin? and user.id == course.user.id if user
  end

  def destroy?
    user.admin? and user.id == course.user.id if user
  end
end
