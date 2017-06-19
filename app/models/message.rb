class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: {if: 'image.blank?' }
  validates :image, presence:  {if: 'body.blank?' }
  validates :group_id, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader

end
