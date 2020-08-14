class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms
  belongs_to :item

  validates :name, presence: true
  validates :item_id, presence: true
end
