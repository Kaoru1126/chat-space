class Group < ApplicationRecord
  validates :name, presence: true

  has_many :members
  has_many :users, through: :members
  has_many :messages

  def self.last_message(group)
      if group.messages.last.image.present?
        return "画像が添付されました"
      elsif group.messages.last.body.present?
        return group.messages.last.body
      else
        return "新着メッセージはありません"
    end
  end
end
