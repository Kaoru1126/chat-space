class Message < ApplicationRecord
  belongs_to :user

  validates :body, length: { minimum: 1 }, if: :image_nil

  def image_nil
    image.file.nil?
  end

  mount_uploader :image, ImageUploader
end
