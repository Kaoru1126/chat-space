class Group < ApplicationRecord
  validates :name, presence: true

  has_many :members
  has_many :users, through: :members
  has_many :messages
end
