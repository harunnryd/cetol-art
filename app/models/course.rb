class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many(:episodes, dependent: :destroy)
  belongs_to(:user)
  mount_uploader :photo, AttachmentUploader
end
