class Message < ApplicationRecord
  belongs_to :user

validates :body, presence: true || :image, presence: true

  mount_uploader :image, ImageUploader
end
