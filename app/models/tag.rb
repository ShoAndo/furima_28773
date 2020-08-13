class Tag < ApplicationRecord
  has_many :items_tags
  has_many :items, through: :items_tags
  validates :tag_name, uniqueness: true
end
