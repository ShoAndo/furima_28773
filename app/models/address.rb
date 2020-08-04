class Address < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 1 }
end
