class Episode < ApplicationRecord
  extend FriendlyId
  belongs_to(:course)
  belongs_to(:user)
  friendly_id(:course_and_episode, use: :slugged)

  def course_and_episode
    ["#{course.title}-#{title}"]
  end
end
