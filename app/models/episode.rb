class Episode < ApplicationRecord
  extend FriendlyId
  belongs_to(:course)
  friendly_id(:course_and_episode, use: :slugged)

  def course_and_episode
    ["#{course.title}-#{title}"]
  end
end
