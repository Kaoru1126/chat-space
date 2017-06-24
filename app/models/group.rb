class Group < ApplicationRecord
  validates :name, presence: true

  has_many :members
  has_many :users, through: :members
  has_many :messages

  def self.last_message(group)
    if group.messages.present?
      group.messages.last.image.present? ? "画像が添付されました" : group.messages.last.body
    else
      return "新着メッセージはありません"
    end
  end
end
