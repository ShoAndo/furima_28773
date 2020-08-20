class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms, dependent: :destroy
  belongs_to :item
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
