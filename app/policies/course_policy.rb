class CoursePolicy < ApplicationPolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? and user.id == course.user.id
  end

  def destroy?
    user.admin? and user.id == course.user.id
  end
end
