class EpisodePolicy < ApplicationPolicy
  attr_reader :user, :episode

  def initialize(user, episode)
    @user = user
    @episode = episode
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? and user.id == episode.user.id
  end

  def destroy?
    user.admin? and user.id == episode.user.id
  end
end
