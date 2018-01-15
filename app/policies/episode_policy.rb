class EpisodePolicy < ApplicationPolicy
  attr_reader :user, :episode

  def initialize(user, episode)
    @user = user
    @episode = episode
  end

  def create?
    user.admin? if user
  end

  def update?
    user.admin? and user.id == episode.user_id if user
  end

  def destroy?
    user.admin? and user.id == episode.user_id if user
  end
end
